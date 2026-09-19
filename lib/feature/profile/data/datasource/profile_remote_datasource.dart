import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mbooking/core/error/app_exception.dart';

abstract class ProfileRemoteDataSource {
  Future<void> updateDisplayName(String displayName);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  final fb.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  fb.User get _user {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw const AuthException('User is not authenticated');
    }
    return user;
  }

  @override
  Future<void> updateDisplayName(String displayName) async {
    try {
      final user = _user;
      await user.updateDisplayName(displayName);
      await _firestore.collection('users').doc(user.uid).set({
        'displayName': displayName,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseError(e.code));
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Failed to update profile');
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _user;
      final email = user.email;
      if (email == null || email.isEmpty) {
        throw const AuthException('Account has no email');
      }

      final credential = fb.EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseError(e.code));
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'wrong-password':
      case 'invalid-credential':
        return 'Current password is incorrect';
      case 'weak-password':
        return 'New password is too weak';
      case 'requires-recent-login':
        return 'Please sign in again and retry';
      case 'network-request-failed':
        return 'Network error';
      default:
        return 'Failed to update profile: $code';
    }
  }
}
