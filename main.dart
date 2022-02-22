import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Test(),
));

class Test extends StatefulWidget { // widget itself creates a state object
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState(); // create a state object, and link it to this widget
}

class _TestState extends State<Test> { // state object
  bool isActive = false;
  DateTime startClockTime = DateTime.now();
  DateTime finishClockTime = DateTime.now();
  Duration timeElapsed = new Duration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clock In / Clock Out'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isActive = !isActive;
              if (isActive) { // button has just been toggled on (clock in occurred)
                timeElapsed = new Duration();
                startClockTime = DateTime.now();
              } else { // button has just been toggled off (clock out occurred)
                finishClockTime = DateTime.now();
                timeElapsed = startClockTime.difference(finishClockTime);
              }
            });
          },
          child: Icon(Icons.access_alarm_outlined),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            children: <Widget> [
              Text('Clock-in time: ' + '$startClockTime'),
              Text('Clock-out time: ' + '$finishClockTime'),
              Text('Time Elapsed: ' + '$timeElapsed'),
            ],
          ),
        ),
    ); // return a widget tree
  }
}
