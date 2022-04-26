// import 'package:flutter/material.dart';
// import 'package:volunteer_time_tracking/services/remote_service.dart';
// import 'package:volunteer_time_tracking/user_home.dart';
// import 'package:intl/intl.dart';
// import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

// class Event extends StatelessWidget {
//   Event({Key? key, required this.currUserId}) : super(key: key);

//   User currUserId;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Event',
//       home: Scaffold(
//         body: MyStatefulWidget(
//           currUserId: currUserId,
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key? key, required this.currUserId}) : super(key: key);

//   User currUserId;

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   bool eventCreateFailed = false;
//   DateTime? date;
//   var formatter = new DateFormat("yyyy-MM-dd");
//   TextEditingController name = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController startDate = TextEditingController();
//   TextEditingController startTime = TextEditingController();

//   createEvent() async {
//     var success = await RemoteService()
//         .createEvent(name.text, description.text, date!, startTime.text);
//     if (success!) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => UserHome(
//                     user: widget.currUserId,
//                   )));
//     } else {
//       setState(() {
//         eventCreateFailed = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Fayetteville Public Library',
//                   style: TextStyle(
//                       color: Colors.orange,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 30),
//                 )),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Events',
//                   style: TextStyle(fontSize: 20),
//                 )),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: name,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Name',
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: description,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Description',
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextFormField(
//                   readOnly: true,
//                   controller: startDate,
//                   onTap: () async {
//                     date = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now().subtract(Duration(days: 7)),
//                         lastDate: DateTime.now().add(Duration(days: 360)));
//                     if (date == null) {
//                       date = DateTime.now();
//                     } else {
//                       startDate.text = formatter.format(date!);
//                     }
//                   }
//                   // controller: startDate,
//                   // decoration: const InputDecoration(
//                   //   border: OutlineInputBorder(),
//                   //   labelText: 'start date',
//                   // ),
//                   // initialDate: DateTime.now(),
//                   // firstDate: DateTime.parse("20200101"),
//                   // lastDate: DateTime.parse("20251212"),
//                   // helpText: "Start Date",
//                   ),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextField(
//                 controller: startTime,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'start time',
//                 ),
//               ),
//             ),
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 child: ElevatedButton(
//                   child: const Text('Create Event'),
//                   onPressed: () {
//                     createEvent();
//                   },
//                 )),
//             if (eventCreateFailed)
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'The event failed to be created.',
//                   style: TextStyle(
//                       fontSize: 15, color: Color.fromARGB(255, 17, 70, 114)),
//                 ),
//               ),
//           ],
//         ));
//   }
// }
