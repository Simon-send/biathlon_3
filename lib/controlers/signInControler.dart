import 'package:biathlon_3/firebase_repository/authentication_repository.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../firebase_repository/firebase_repository.dart';

class SignInnController extends GetxController {
  static SignInnController get instance => Get.find();
  final controler = Get.put(FirestoreReposetory());

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registreUser(
    //String fullName,
    String email,
    //String phoneNo,
    String password,
  ) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    //FirestoreReposetory.instance.createUserWithEmailAndPassword(email, password);
  }
}
