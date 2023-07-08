import 'dart:typed_data';

import 'package:biathlon_3/classes/activety_class.dart';
import 'package:biathlon_3/pages/history/activety_screan.dart';
import 'package:biathlon_3/pages/history/target_stil_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../controlers/screanshot_controler.dart';

class HistoryTile extends StatefulWidget {
  Activity activity;
  HistoryTile({required this.activity});

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  List<List<double>> downscale(Activity activity, double downscale) {
    List<List<double>> shots = [];
    for (int i = 0; i < activity.shots.length; i++) {
      shots.add(
          [activity.shots[i][0] * downscale, activity.shots[i][1] * downscale]);
    }
    return shots;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivetyScrean(activty: widget.activity),
              ));
        },
        child: Column(
          children: [
            Text(widget.activity.activityName),
            TargetStillWiget(
              shots: downscale(widget.activity, 0.4),
              minutre: true,
            )
          ],
        ),
      ),
    );
  }
}
