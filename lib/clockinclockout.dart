import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'clockinclockout_eventsdropdown.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';

// void main() => runApp(new MyApp());

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

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new HomePage(),
//     );
//   }
// }

class ClockInClockOut extends StatefulWidget {
  @override
  State<ClockInClockOut> createState() => _ClockInClockOutState();
}

class UserPickedValues {
  // values are written when user presses "Done" in the clock-in date picker
  static DateTime datePicked = DateTime.now();
  static DateTime clockInTime = DateTime.now();
  static DateTime clockOutTime = DateTime.now();
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

class _ClockInClockOutState extends State<ClockInClockOut> {
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
    return MaterialApp(
      theme: VolunteerTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Volunteer Time Entry'),
        ),
        body: Center(
          child: Container(
            width: displayWidth(context) * .60,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 126, 148, 203),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                const SizedBox(width: 10, height: 10), // padding
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 100, 105, 111),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (_) => EventPicker()))
                              .then((value) => updatePage());
                        },
                        child: Text('Click to choose event'),
                        style: TextButton.styleFrom(primary: Colors.lightBlue),
                      ),
                      Text('Event chosen: ${EventChosen.eventChosen}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(width: 10, height: 10), // padding
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 100, 105, 111),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2022, 1, 1),
                                maxTime: DateTime(
                                    getCurrentDate().year,
                                    getCurrentDate().month,
                                    getCurrentDate().day),
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
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Text(
                            'Choose Date',
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                      Text('${UserPickedValues.datePicked}',
                          style: TextStyle(color: Colors.white)),
                      Text('      '), // whitespace
                    ],
                  ),
                ),
                const SizedBox(width: 10, height: 10), // padding
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 100, 105, 111),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
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
                            'Choose Clock-In Time',
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                      Text('${UserPickedValues.clockInTime}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(width: 10, height: 10), // padding
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 100, 105, 111),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
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
                            'Choose Clock-Out Time',
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                      Text('${UserPickedValues.clockOutTime}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(width: 10, height: 10), // padding
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 113, 200, 184),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Submit'),
                      style: TextButton.styleFrom(primary: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
