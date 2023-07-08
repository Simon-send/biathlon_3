import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../classes/activety_class.dart';

class ScrewPage extends StatefulWidget {
  Activity activity;
  ScrewPage({required this.activity});

  @override
  State<ScrewPage> createState() => _ScrewPageState();
}

class _ScrewPageState extends State<ScrewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.activity.activityName)),
    );
  }
}
