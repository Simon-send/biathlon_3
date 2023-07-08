import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopwatchWidget extends StatefulWidget {
  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  bool isRunning = false;
  Stopwatch stopwatch = Stopwatch();
  Duration lapedTime = Duration();
  List<String> laps = [];
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startStopwatch() {
    setState(() {
      if (isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
        timer = Timer.periodic(Duration(milliseconds: 84), (_) {
          setState(() {}); // Update UI every 100 milliseconds
        });
      }
      isRunning = !isRunning;
    });
  }

  void resetStopwatch() {
    if (stopwatch.isRunning) {
      setState(() {
        laps.add(formatDuration(stopwatch.elapsed - lapedTime));
        lapedTime = stopwatch.elapsed;
      });
    } else {
      setState(() {
        stopwatch.stop();
        stopwatch.reset();
        laps.clear();
        isRunning = false;
        timer?.cancel();
        lapedTime = Duration.zero;
      });
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = (duration.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds.$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: Column(
        children: [
          Center(
            child: Text(
              formatDuration(stopwatch.elapsed),
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: startStopwatch,
                child: Text(isRunning ? 'Stop' : 'Start'),
              ),
              ElevatedButton(
                onPressed: resetStopwatch,
                child: Text(isRunning ? 'Lap' : 'Reset'),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: GridView.builder(
              itemCount: laps.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4.5 / 1),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(
                      'Lap ${index + 1}: ${laps[index]}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
