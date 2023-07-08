import 'package:biathlon_3/firebase_repository/authentication_repository.dart';
import 'package:biathlon_3/firebase_repository/firebase_repository.dart';
import 'package:biathlon_3/pages/target_screans/target.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../classes/activety_class.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ActivetyName = TextEditingController();
    Activity activity = Activity(
      activityName: 'Some Activity',
      shots: [
        [1.5, 2.3],
        [3.7, 4.1],
        [2.0, 3.5],
        [1.2, 1.8],
        [0.9, 1.0]
      ],
    );

    Map<String, dynamic> activityJson = activity.toJson();

    final firestoreReposetory = Get.put(FirestoreReposetory());

    String isTyped(String string) {
      if (string == '') {
        return 'My Activety';
      } else {
        return string;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        Center(
          child: Text('Welcome Home'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Target(name: isTyped(ActivetyName.text))),
              );
            },
            child: Text('det er nå det skjer')),
        TextFormField(
          controller: ActivetyName,
          decoration: const InputDecoration(
              label: Text('Activety Name (not requierd)')),
        ),
      ]),
    );
  }
}
