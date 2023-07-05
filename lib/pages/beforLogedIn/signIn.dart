import 'package:biathlon_3/controlers/signInControler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final controler = Get.put<SignInnController>(SignInnController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('You need to signin'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controler.fullName,
                decoration: const InputDecoration(label: Text('full name')),
              ),
              TextFormField(
                controller: controler.email,
                decoration:
                    const InputDecoration(label: Text('email@example.com')),
              ),
              TextFormField(
                controller: controler.phoneNo,
                decoration: const InputDecoration(label: Text('phone number')),
              ),
              TextFormField(
                controller: controler.password,
                decoration: const InputDecoration(label: Text('password')),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        SignInnController.instance.registreUser(
                            controler.email.text, controler.password.text);
                      },
                      child: Text('submitt')))
            ],
          ),
        ));
  }
}
