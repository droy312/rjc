import 'package:flutter/material.dart';
import 'package:rjc/views/home_page.dart';
import 'package:rjc/views/login_page.dart';
import 'package:rjc/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/home_page': (context) => HomePage(),
      // },
      home: Wrapper(),
    );
  }
}