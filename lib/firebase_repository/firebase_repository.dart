import 'dart:convert';

import 'package:biathlon_3/firebase_repository/exceptions/sign_in_with_email_and_password_failure.dart';
import 'package:biathlon_3/pages/beforLogedIn/welcomscrean.dart';
import 'package:biathlon_3/pages/home.dart';
import 'package:biathlon_3/pages/beforLogedIn/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreReposetory extends GetxController {
  static FirestoreReposetory get instance => Get.find();

  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    if (userId != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set({'email': email, 'user id': userId});
      } on FirebaseAuthException catch (e) {
        final ex = SignInWithEmailAndPasswordFailure.code(e.code);
        print(ex.mesage);
        throw ex;
      } catch (_) {
        const ex = SignInWithEmailAndPasswordFailure();
        print(ex.mesage);
        throw ex;
      }
    } else {
      throw 'user id is null';
    }
  }

  Future<void> storeActivity(json) async {
    if (userId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .collection('activity')
          .doc()
          .set({'a': 'a'});
    }
  }
}
