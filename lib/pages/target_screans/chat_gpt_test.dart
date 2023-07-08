import 'dart:async';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stopwatch _stopwatch = Stopwatch();
  final _laps = <Duration>[];
  final _lapDiffs = <Duration>[];
  late Timer _timer;

  void _startStopButtonPressed() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
        _startTimer();
      }
    });
  }

  void _lapResetButtonPressed() {
    setState(() {
      if (_stopwatch.isRunning) {
        _laps.insert(0, _stopwatch.elapsed);
        _lapDiffs.insert(
            0,
            _stopwatch.elapsed -
                (_laps.length > 1 ? _laps[1] : Duration(seconds: 0)));
      } else {
        _stopwatch.reset();
        _laps.clear();
        _lapDiffs.clear();
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, "0")}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}:${(_stopwatch.elapsed.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, "0")}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _startStopButtonPressed,
                  child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
                ),
                ElevatedButton(
                  onPressed: _lapResetButtonPressed,
                  child: Text(_stopwatch.isRunning ? 'Lap' : 'Reset'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _laps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('Lap ${index + 1}'),
                    title: Text(
                      '${_laps[index].inMinutes.toString().padLeft(2, "0")}:${(_laps[index].inSeconds % 60).toString().padLeft(2, "0")}:${(_laps[index].inMilliseconds % 1000 ~/ 10).toString().padLeft(2, "0")}',
                    ),
                    trailing: index == 0
                        ? null
                        : Text(
                            '+${_lapDiffs[index].inMinutes.toString().padLeft(2, "0")}:${(_lapDiffs[index].inSeconds % 60).toString().padLeft(2, "0")}:${(_lapDiffs[index].inMilliseconds % 1000 ~/ 10).toString().padLeft(2, "0")}',
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
