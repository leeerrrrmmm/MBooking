import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mbooking/core/error/app_exception.dart';
import 'package:mbooking/core/user/data/model/current_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<CurrentUserModel> signInWithEmail(String email, String password);
  Future<CurrentUserModel> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  });
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  final fb.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  CollectionReference get _usersCollection => _firestore.collection('users');

  @override
  Future<CurrentUserModel> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw const AuthException('User is null after registration');
      }

      if (displayName != null && displayName.isNotEmpty) {
        await user.updateDisplayName(displayName);
      }

      final now = DateTime.now();
      await _usersCollection.doc(user.uid).set({
        'email': user.email ?? email,
        'displayName': displayName ?? user.displayName,
        'photoUrl': user.photoURL,
        'createdAt': Timestamp.fromDate(now),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return CurrentUserModel(
        id: user.uid,
        email: user.email ?? email,
        displayName: displayName ?? user.displayName,
        photoUrl: user.photoURL,
      );
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseError(e.code));
    } on FirebaseException catch (e) {
      throw ServerException('Firestore error: ${e.message}');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CurrentUserModel> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) throw const AuthException('User is null');

      final doc = await _usersCollection.doc(user.uid).get();
      if (doc.exists) {
        return CurrentUserModel.fromFirestore(doc);
      }

      return CurrentUserModel.fromFirebase(user);
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseError(e.code));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Wrong password';
      case 'network-request-failed':
        return 'Network error';
      default:
        return 'Authentication error: $code';
    }
  }
}
