import 'package:biathlon_3/controlers/loginControler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginScrean extends StatefulWidget {
  const LoginScrean({super.key});

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  final controler = Get.put(LoginControler());
  TextEditingController fulNameControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                        if (_formKey.currentState!.validate()) {
                          LoginControler.instance.registreUser(
                              controler.email.text.trim(),
                              controler.password.text.trim());
                        }
                      },
                      child: Text('submitt')))
            ],
          ),
        ));
    ;
  }
}
