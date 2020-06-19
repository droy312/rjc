import 'package:flutter/material.dart';
import 'package:rjc/views/login_page.dart';
import 'package:rjc/views/sub_views/announcements.dart';
import 'package:rjc/views/sub_views/attendance.dart';
import 'package:rjc/views/home_page.dart';
import 'package:rjc/views/sub_views/timetable.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
