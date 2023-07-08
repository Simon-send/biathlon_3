import 'package:biathlon_3/classes/activety_class.dart';
import 'package:biathlon_3/pages/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryScrean extends StatefulWidget {
  List<Activity> history;
  HistoryScrean({super.key, required this.history});

  @override
  State<HistoryScrean> createState() => _HistoryScreanState();
}

class _HistoryScreanState extends State<HistoryScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: GridView.builder(
          itemCount: widget.history.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1),
          itemBuilder: (context, index) {
            return HistoryTile(activity: widget.history[index]);
          }),
    );
  }
}
