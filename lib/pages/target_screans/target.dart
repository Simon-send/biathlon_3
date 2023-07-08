import 'dart:math';

import 'package:biathlon_3/classes/activety_class.dart';
import 'package:biathlon_3/pages/screw/screw_page.dart';
import 'package:biathlon_3/pages/target_screans/stopwatch.dart';
import 'package:biathlon_3/pages/target_screans/target_image.dart';
import 'package:biathlon_3/pages/history/history_screan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:async';

import 'moveable_stackItem.dart';

class Target extends StatefulWidget {
  String name;
  Target({super.key, required this.name});

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  int shotsCount = 1;
  int zoomIndex = 0;

  List<MoveableStackItem> itamStac = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    onTapDown(tapInfo) {
      double x = tapInfo.localPosition.dx;
      double y = tapInfo.localPosition.dy;
      // or user the local position method to get the offset
      print(tapInfo.localPosition);
      print("tap down " + x.toString() + ", " + y.toString());

      if (shotsCount <= 5) {
        setState(() {
          itamStac.add(MoveableStackItem(
            x: x,
            y: y,
            name: shotsCount,
            movebel: true,
          ));

          print('$x $y');
        });
        shotsCount += 1;
      }
    }

    chageImage(List<MoveableStackItem> itamStac, double magnefy) {
      List<MoveableStackItem> newItamStac = [];
      for (var i = 1; i <= 5; i++) {
        newItamStac[i] = MoveableStackItem(
            x: (itamStac[i].x - width) * magnefy + width,
            name: itamStac[i].name,
            y: (itamStac[i].x - width) * magnefy + width,
            movebel: true);
      }
      return newItamStac;
    }

    List<List<double>> returnShots(List<MoveableStackItem> Wigetshots) {
      List<List<double>> shotsActivaty = [];
      for (int i = 0; i < Wigetshots.length; i++) {
        shotsActivaty.add([Wigetshots[i].x, Wigetshots[i].y]);
      }
      return shotsActivaty;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScrewPage(
                          activity: Activity(
                              activityName: widget.name,
                              shots: returnShots(itamStac)))),
                );
              },
              icon: Icon(Icons.add_chart)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoryScrean(history: [
                            Activity(
                                activityName: widget.name,
                                shots: returnShots(itamStac))
                          ])),
                );
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 570,
          child: GestureDetector(
              onTapUp: (tapInfo) => onTapDown(tapInfo),
              child: Stack(children: [
                TargetImage(),
                ...itamStac,
              ])),
        ),
        StopwatchWidget()
      ]),
    );
  }
}
