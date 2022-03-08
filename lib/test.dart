import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volunteer_time_tracking/api/api.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
import 'package:volunteer_time_tracking/user.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const TestingStatefulWidget(),
      ),
    );
    // return MaterialApp(
    //   title: 'Time Tracker',
    //   home: Scaffold(
    //     body: const MyStatefulWidget(),
    //   ),
    // );
  }
}

class TestingStatefulWidget extends StatefulWidget {
  const TestingStatefulWidget({Key? key}) : super(key: key);

  @override
  State<TestingStatefulWidget> createState() => _TestingStatefulWidgetState();
}

class _TestingStatefulWidgetState extends State<TestingStatefulWidget> {
  // TextEditingController firstName = TextEditingController();
  // TextEditingController lastName = TextEditingController();
  // TextEditingController userName = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  List<User>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from api
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, index) {
            return Container(child: Text(users![index].name));
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
