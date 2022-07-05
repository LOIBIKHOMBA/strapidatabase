import 'dart:developer';

import 'package:fetchdatafromserver/service/service.api.dart';
import 'package:flutter/material.dart';

import 'model/user.model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const UserDetails(),
    );
  }
}

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<UserModel> user = [];
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var _user = await ServiceApi().getdata();
    setState(() {
      user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User mayam")),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (c, i) {
            return Text(user[i].name);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var user = await ServiceApi().getdata();
          log(user[1].name);
        },
      ),
    );
  }
}
