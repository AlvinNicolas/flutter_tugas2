import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;
  int _selectedDuration = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$_seconds seconds',
            style: TextStyle(fontSize: 48.0),
          ),
          SizedBox(height: 20.0),
          DropdownButton<int>(
            value: _selectedDuration,
            items: [60, 120, 180, 300]
                .map((duration) => DropdownMenuItem<int>(
              value: duration,
              child: Text('$duration seconds'),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedDuration = value!;
                _seconds = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              startTimer();
            },
            child: Text('Start Timer'),
          ),
        ],
      ),
    );
  }
}
