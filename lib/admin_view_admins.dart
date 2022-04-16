import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_account.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:collection/collection.dart';

class ViewAdmins extends StatelessWidget {
  const ViewAdmins({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Current Admins Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const ViewAdminsPage(
          title:
              'Fayetteville Public Library Volunteer System - Current Admins Page'),
    );
  }
}

class ViewAdminsPage extends StatefulWidget {
  const ViewAdminsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewAdminsPage> createState() => _ViewAdminsPage();
}

class _ViewAdminsPage extends State<ViewAdminsPage> {
  final List<Map> _admins = [
    {
      'isActive': 'False',
      'firstName': 'John',
      'lastName': 'Doe',
      'email': 'johndoe@gmail.com',
      'phoneNumber': '111-111-1111'
    },
    {
      'isActive': 'False',
      'firstName': 'Jane',
      'lastName': 'Doe',
      'email': 'janedoe@gmail.com',
      'phoneNumber': '511-111-1111'
    },
    {
      'isActive': 'False',
      'firstName': 'Joe',
      'lastName': 'Doe',
      'email': 'joedoe@gmail.com',
      'phoneNumber': '411-111-1111'
    },
    {
      'isActive': 'False',
      'firstName': 'Peet',
      'lastName': 'Doe',
      'email': 'peetdoe@gmail.com',
      'phoneNumber': '311-111-1111'
    },
    {
      'isActive': 'False',
      'firstName': 'Allice',
      'lastName': 'Doe',
      'email': 'Allicedoe@gmail.com',
      'phoneNumber': '211-111-1111'
    },
  ];
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(_admins.length, (int index) => false);
  }

  bool? _isEditMode = false;

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('isActive')),
      const DataColumn(label: Text('First Name')),
      const DataColumn(label: Text('Last Name')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Phone Number')),
    ];
  }

  List<DataRow> _createRows() {
    return _admins
        .mapIndexed((index, admins) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              // All rows will have the same selected color.
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).primaryColor.withOpacity(0.08);
              }
              // Even rows will have a grey color.
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null; // Use default value for other states and odd rows.
            }),
            cells: [
              DataCell(Text(admins['isActive'].toString())),
              _createTitleCell(admins['firstName']),
              DataCell(Text(admins['lastName'])),
              DataCell(Text(admins['email'])),
              DataCell(Text(admins['phoneNumber']))
            ],
            selected: _selected[index],
            onSelectChanged: (bool? selected) {
              setState(() {
                _selected[index] = selected!;
              });
            }))
        .toList();
  }

  DataCell _createTitleCell(adminFirstName) {
    return DataCell(_isEditMode == true
        ? TextFormField(
            initialValue: adminFirstName, style: TextStyle(fontSize: 14))
        : Text(adminFirstName));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        const Text('Edit'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Visibility(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10) /*Spacing for user*/,
              Container(
                width: displayWidth(context) * .80,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Admins',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [_createDataTable(), _createCheckboxField()],
                ),
              )
            ],
          ),
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
      /*Page Navagation*/
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AdminHome()));
            },
            icon: const Icon(
              Icons.home,
              size: 20,
            ),
            label: const Text('Home'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('View Events'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserEnrolled()));
            */
            },
            child: const Text('Edit Events'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserCompleted()));
            */
            },
            child: const Text('Create Report'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserAccount()));
            */
            },
            child: const Text('View Reports'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserSettings()));
            */
            },
            child: const Text('View Users'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegistration()));
            */
            },
            child: const Text('Edit Users'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('View Admins'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegistration()));
            */
            },
            child: const Text('Edit Admins'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminAccount()));
            },
            child: const Text('Admin Profile'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminSettings()));
            },
            child: const Text('Profile Settings'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            icon: const Icon(
              Icons.logout,
              size: 20,
            ),
            label: const Text('Logout'),
          ),
        ],
      )),
    );
  }
}
