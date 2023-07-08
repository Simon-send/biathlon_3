import 'package:biathlon_3/pages/history/target_stil_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../classes/activety_class.dart';

class ActivetyScrean extends StatelessWidget {
  Activity activty;
  ActivetyScrean({super.key, required this.activty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activty.activityName),
      ),
      body: TargetStillWiget(
        shots: activty.shots,
        minutre: false,
      ),
    );
  }
}
