import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'clockinclockout_eventsdropdown.dart';

void main() => runApp(new MyApp());

// datetime picker documentation: https://pub.dev/packages/flutter_datetime_picker/example
class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}

// List<DropdownMenuItem<String>> get dropdownItems {
//   List<DropdownMenuItem<String>> menuItems = [
//     DropdownMenuItem(child: Text("USA"), value: "USA"),
//     DropdownMenuItem(child: Text("Canada"), value: "Canada"),
//     DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
//     DropdownMenuItem(child: Text("England"), value: "England"),
//   ];
//   return menuItems;
// }

// class DropdownItem extends StatefulWidget {
//   const DropdownItem({Key? key}) : super(key: key);

//   @override
//   _DropdownItemState createState() => _DropdownItemState();
// }

// class _DropdownItemState extends State<DropdownItem> {
//   String selectedValue = "USA";
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(value: selectedValue, items: dropdownItems);
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class UserPickedValues {
  // values are written when user presses "Done" in the clock-in date picker
  static DateTime datePicked = DateTime.now();
  static DateTime clockInTime = DateTime.now();
  static DateTime clockOutTime = DateTime.now();
}

class _HomePageState extends State<HomePage> {
  void updatePage() {
    // purpose of this is to get the Event chosen text widget to update the screen with the event picked when the user chooses the event
    setState(() {});
  }

  DateTime getCurrentDate() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datetime Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(
                              MaterialPageRoute(builder: (_) => EventPicker()))
                          .then((value) => updatePage());
                    },
                    child: Text('Click to choose event')),
                Text('Event chosen: ${EventChosen.eventChosen}'),
              ],
            ),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2022, 1, 1),
                          maxTime: DateTime(getCurrentDate().year,
                              getCurrentDate().month, getCurrentDate().day),
                          // theme: DatePickerTheme(
                          //     headerColor: Colors.orange,
                          //     backgroundColor: Colors.blue,
                          //     itemStyle: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 18),
                          //     doneStyle:
                          //         TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                        UserPickedValues.datePicked = date;
                        updatePage(); // refresh page after user picks value
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Pick Date',
                      style: TextStyle(color: Colors.blue),
                    )),
                Text('${UserPickedValues.datePicked}'),
                Text('      '), // whitespace
              ],
            ),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                        UserPickedValues.clockInTime = date;
                        updatePage(); // refresh page after user picks value
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      'Pick Clock-In Time',
                      style: TextStyle(color: Colors.blue),
                    )),
                Text('${UserPickedValues.clockInTime}'),
              ],
            ),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                        UserPickedValues.clockOutTime = date;
                        updatePage(); // refresh the page after user picks value
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      'Pick Clock-Out Time',
                      style: TextStyle(color: Colors.blue),
                    )),
                Text('${UserPickedValues.clockOutTime}'),
              ],
            ),
            TextButton(onPressed: () {}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
