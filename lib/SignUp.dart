// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }

  // @override
  // State<MyStatefulWidget> createState() => _MyStatefulWidgetState();

  // return Scaffold(
  //   backgroundColor: Colors.white,
  //   appBar: AppBar(
  //     title: Text("Login Page"),
  //   ),
  //   body: SingleChildScrollView(
  //     child: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(top: 60.0),
  //           child: Center(
  //             child: Container(
  //                 width: 200,
  //                 height: 150,
  //                 /*decoration: BoxDecoration(
  //                     color: Colors.red,
  //                     borderRadius: BorderRadius.circular(50.0)),*/
  //                 child: Image.asset('asset/images/flutter-logo.png')),
  //           ),
  //         ),
  //         Padding(
  //           //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
  //           padding: EdgeInsets.symmetric(horizontal: 15),
  //           child: TextField(
  //             decoration: InputDecoration(
  //                 border: OutlineInputBorder(),
  //                 labelText: 'Email',
  //                 hintText: 'Enter valid email id as abc@gmail.com'),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(
  //               left: 15.0, right: 15.0, top: 15, bottom: 0),
  //           //padding: EdgeInsets.symmetric(horizontal: 15),
  //           child: TextField(
  //             obscureText: true,
  //             decoration: InputDecoration(
  //                 border: OutlineInputBorder(),
  //                 labelText: 'Password',
  //                 hintText: 'Enter secure password'),
  //           ),
  //         ),
  //         FlatButton(
  //           onPressed: () {
  //             //TODO FORGOT PASSWORD SCREEN GOES HERE
  //           },
  //           child: Text(
  //             'Forgot Password',
  //             style: TextStyle(color: Colors.blue, fontSize: 15),
  //           ),
  //         ),
  //         Container(
  //           height: 50,
  //           width: 250,
  //           decoration: BoxDecoration(
  //               color: Colors.blue, borderRadius: BorderRadius.circular(20)),
  //           child: FlatButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               'Login',
  //               style: TextStyle(color: Colors.white, fontSize: 25),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 130,
  //         ),
  //         Text('New User? Create Account')
  //       ],
  //     ),
  //   ),
  // );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Fayetteville Public Library',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
          ],
        ));
  }
}
