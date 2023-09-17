import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  List<String> _laps = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _stopwatch.elapsed.inMilliseconds.toString(),
            style: TextStyle(fontSize: 48.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isRunning) {
                      _stopwatch.stop();
                      _isRunning = false;
                    } else {
                      _stopwatch.start();
                      _isRunning = true;
                      _startTimer(); // Mulai mengupdate stopwatch
                    }
                  });
                },
                child: Text(_isRunning ? 'Stop' : 'Start'),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isRunning) {
                      _laps.add(_stopwatch.elapsed.inMilliseconds.toString());
                    }
                  });
                },
                child: Text('Lap'),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _stopwatch.reset();
                    _laps.clear();
                  });
                },
                child: Text('Reset'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ListView.builder(
            itemCount: _laps.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Lap ${index + 1}'),
                subtitle: Text('${_laps[index]} ms'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    const oneMillisecond = const Duration(milliseconds: 1);
    Timer.periodic(oneMillisecond, (Timer timer) {
      if (_isRunning) {
        setState(() {}); // Memaksa perubahan pada tampilan setiap milidetik
      } else {
        timer.cancel();
      }
    });
  }
}
