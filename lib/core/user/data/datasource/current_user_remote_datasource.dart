import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mbooking/core/user/data/model/current_user_model.dart';

abstract class CurrentUserRemoteDataSource {
  Stream<CurrentUserModel?> watchCurrentUser();

  Future<CurrentUserModel?> getCurrentUser();
}

class CurrentUserRemoteDataSourceImpl implements CurrentUserRemoteDataSource {
  CurrentUserRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  final fb.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  CollectionReference get _usersCollection => _firestore.collection('users');

  @override
  Stream<CurrentUserModel?> watchCurrentUser() {
    final controller = StreamController<CurrentUserModel?>();
    StreamSubscription<fb.User?>? authSub;
    StreamSubscription<DocumentSnapshot>? docSub;

    Future<void> listenToProfile(fb.User user) async {
      await docSub?.cancel();
      docSub = _usersCollection
          .doc(user.uid)
          .snapshots()
          .listen(
            (doc) {
              if (controller.isClosed) return;
              if (doc.exists) {
                controller.add(CurrentUserModel.fromFirestore(doc));
              } else {
                controller.add(CurrentUserModel.fromFirebase(user));
              }
            },
            onError: (Object error, StackTrace stackTrace) {
              if (!controller.isClosed) {
                controller.addError(error, stackTrace);
              }
            },
          );
    }

    controller
      ..onListen = () {
        authSub = _firebaseAuth.authStateChanges().listen(
          (user) async {
            if (user == null) {
              await docSub?.cancel();
              docSub = null;
              if (!controller.isClosed) controller.add(null);
              return;
            }
            await listenToProfile(user);
          },
          onError: (Object error, StackTrace stackTrace) {
            if (!controller.isClosed) {
              controller.addError(error, stackTrace);
            }
          },
        );
      }
      ..onCancel = () async {
        await docSub?.cancel();
        await authSub?.cancel();
      };

    return controller.stream;
  }

  @override
  Future<CurrentUserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    try {
      final doc = await _usersCollection.doc(user.uid).get();
      if (doc.exists) return CurrentUserModel.fromFirestore(doc);
    } catch (_) {}

    return CurrentUserModel.fromFirebase(user);
  }
}
