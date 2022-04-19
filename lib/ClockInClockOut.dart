import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

// void main() => runApp(MaterialApp(
//       home: Test(),
//     ));

class ClockInClockOut extends StatefulWidget {
  // widget itself creates a state object
  ClockInClockOut({Key? key, required this.currUserId}) : super(key: key);

  User currUserId;
  @override
  _ClockInClockOutState createState() =>
      _ClockInClockOutState(); // create a state object, and link it to this widget
}

class _ClockInClockOutState extends State<ClockInClockOut> {
  // state object
  bool isActive = false;
  DateTime startClockTime = DateTime.now();
  DateTime finishClockTime = DateTime.now();
  Duration timeElapsed = new Duration();
  // double hours = 0.0;
  final myController = TextEditingController();

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
            if (isActive) {
              // button has just been toggled on (clock in occurred)
              timeElapsed = new Duration();
              startClockTime = DateTime.now();
            } else {
              // button has just been toggled off (clock out occurred)
              finishClockTime = DateTime.now();
              timeElapsed = startClockTime.difference(finishClockTime);
            }
          });
        },
        child: Icon(Icons.access_alarm_outlined),
        backgroundColor: isActive ? Colors.red : Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Clock-in time: ' + '$startClockTime'),
            Text('Clock-out time: ' + '$finishClockTime'),
            Text('Time Elapsed: ' + '$timeElapsed'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Manually enter hours of volunteer service',
              ),
              controller: myController,
            ),
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Submit hours'),
            ),
            Text(myController.text + ' hours of service logged!'),
          ],
        ),
      ),
    ); // return a widget tree
  }
}
