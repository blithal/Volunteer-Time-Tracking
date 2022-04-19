import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_account.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:collection/collection.dart';

class ViewEvents extends StatelessWidget {
  const ViewEvents({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Current Events Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const ViewEventsPage(
          title:
              'Fayetteville Public Library Volunteer System - Current Events Page'),
    );
  }
}

class ViewEventsPage extends StatefulWidget {
  const ViewEventsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewEventsPage> createState() => _ViewEventsPage();
}

class _ViewEventsPage extends State<ViewEventsPage> {
  final List<Map> _events = [
    {
      'title': 'Community Clean Up',
      'organizer': 'John Doe',
      'date': '1/2/22',
      'startTime': '1:00pm',
      'endTime': '2:00pm',
      'address': '113 W Mountain St, Fayetteville, AR 72701',
      'participants': 'John Doe, Jane Doe, Bob Builder, Frank West'
    },
    {
      'title': 'Community Clean Up',
      'organizer': 'John Doe',
      'date': '1/2/22',
      'startTime': '1:00pm',
      'endTime': '2:00pm',
      'address': '113 W Mountain St, Fayetteville, AR 72701',
      'participants': 'John Doe, Jane Doe, Bob Builder, Frank West'
    },
    {
      'title': 'Community Clean Up',
      'organizer': 'John Doe',
      'date': '1/2/22',
      'startTime': '1:00pm',
      'endTime': '2:00pm',
      'address': '113 W Mountain St, Fayetteville, AR 72701',
      'participants': 'John Doe, Jane Doe, Bob Builder, Frank West'
    },
    {
      'title': 'Community Clean Up',
      'organizer': 'John Doe',
      'date': '1/2/22',
      'startTime': '1:00pm',
      'endTime': '2:00pm',
      'address': '113 W Mountain St, Fayetteville, AR 72701',
      'participants': 'John Doe, Jane Doe, Bob Builder, Frank West'
    },
    {
      'title': 'Community Clean Up',
      'organizer': 'John Doe',
      'date': '1/2/22',
      'startTime': '1:00pm',
      'endTime': '2:00pm',
      'address': '113 W Mountain St, Fayetteville, AR 72701',
      'participants': 'John Doe, Jane Doe, Bob Builder, Frank West'
    },
  ];
  List<bool> _selected = [];
  int _currentSortColumn = 0;
  bool _isSortAsc = true;

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(_events.length, (int index) => false);
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

  Scrollbar _createDataTable() {
    return Scrollbar(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: _createColumns(),
                rows: _createRows(),
                sortColumnIndex: _currentSortColumn,
                sortAscending: _isSortAsc)));
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text('Title'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['title'].compareTo(a['title']));
            } else {
              _events.sort((a, b) => a['title'].compareTo(b['title']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('Organizer'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['organizer'].compareTo(a['organizer']));
            } else {
              _events.sort((a, b) => a['organizer'].compareTo(b['organizer']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('Date'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['date'].compareTo(a['date']));
            } else {
              _events.sort((a, b) => a['date'].compareTo(b['date']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('Start Time'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['startTime'].compareTo(a['startTime']));
            } else {
              _events.sort((a, b) => a['startTime'].compareTo(b['startTime']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('End Time'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['endTime'].compareTo(a['endTime']));
            } else {
              _events.sort((a, b) => a['endTime'].compareTo(b['endTime']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('Address'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort((a, b) => b['address'].compareTo(a['address']));
            } else {
              _events.sort((a, b) => a['address'].compareTo(b['address']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      DataColumn(
        label: Text('Participants'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _events.sort(
                  (a, b) => b['participants'].compareTo(a['participants']));
            } else {
              _events.sort(
                  (a, b) => a['participants'].compareTo(b['participants']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
    ];
  }

  List<DataRow> _createRows() {
    return _events
        .mapIndexed((index, events) => DataRow(
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
              _createTitleCell(events['title']),
              _createTitleCell(events['organizer']),
              _createTitleCell(events['date']),
              _createTitleCell(events['startTime']),
              _createTitleCell(events['endTime']),
              _createTitleCell(events['address']),
              _createTitleCell(events['participants'])
            ],
            selected: _selected[index],
            onSelectChanged: (bool? selected) {
              setState(() {
                _selected[index] = selected!;
              });
            }))
        .toList();
  }

  DataCell _createTitleCell(eventsValue) {
    return DataCell(_isEditMode == true
        ? TextFormField(
            initialValue: eventsValue, style: const TextStyle(fontSize: 14))
        : Text(eventsValue));
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
                  "Events",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [_createDataTable(), _createCheckboxField()],
                ),
              ),
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
            child: const Text('Events'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewUsers()));
            },
            child: const Text('Users'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewAdmins()));
            },
            child: const Text('Admins'),
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
            child: const Text('Reports'),
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
