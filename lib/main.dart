import 'package:biathlon_3/firebase_options.dart';
import 'package:biathlon_3/firebase_repository/authentication_repository.dart';
import 'package:biathlon_3/pages/beforLogedIn/signIn.dart';
import 'package:biathlon_3/pages/beforLogedIn/welcomscrean.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: WelcomScrean(),
    );
  }
}
