import 'dart:typed_data';

import 'package:biathlon_3/pages/target_screans/moveable_stackItem.dart';
import 'package:biathlon_3/pages/target_screans/target_image.dart';
import 'package:flutter/material.dart';

import '../../controlers/screanshot_controler.dart';

class TargetStillWiget extends StatefulWidget {
  List<List<double>> shots;
  bool minutre;
  TargetStillWiget({required this.shots, required this.minutre});

  @override
  _TargetStillWigetState createState() => _TargetStillWigetState();
}

class _TargetStillWigetState extends State<TargetStillWiget> {
  List<MoveableStackItem> shotsTo(List<List<double>> shots) {
    List<MoveableStackItem> widgetList = [];
    for (int i = 0; i < shots.length; i++) {
      widgetList.add(MoveableStackItem(
        x: shots[i][0],
        name: (i + 1),
        y: shots[i][1],
        movebel: false,
        minuter: widget.minutre,
      ));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [TargetImage(), ...shotsTo(widget.shots)],
    );
  }
}
