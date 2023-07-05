import 'dart:math';

import 'package:biathlon_3/controlers/signInControler.dart';
import 'package:biathlon_3/firebase_repository/authentication_repository.dart';

import 'package:biathlon_3/pages/beforLogedIn/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../home.dart';
import 'login.dart';

class WelcomScrean extends StatefulWidget {
  const WelcomScrean({super.key});

  @override
  State<WelcomScrean> createState() => _WelcomScreanState();
}

class _WelcomScreanState extends State<WelcomScrean> {
  @override
  Widget build(BuildContext context) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        ElevatedButton(
          onPressed: () => Get.offAll(() => LoginScrean()),
          child: Text('Login'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.offAll(() => SignInScreen());
          },
          child: Text('Sign up'),
        ),
        ElevatedButton(
          onPressed: () {
            AuthenticationRepository.instance.createUserWithEmailAndPassword(
                '${getRandomString(5)}@randomuser.no', getRandomString(6));
          },
          child: Text('Continu as gest'),
        ),
      ]),
    );
  }
}
