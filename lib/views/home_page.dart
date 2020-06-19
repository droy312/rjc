import 'package:flutter/material.dart';
import 'package:rjc/helper/resources.dart';
import 'package:rjc/helper/user.dart';
import 'package:rjc/views/sub_views/announcements.dart';
import 'package:rjc/views/sub_views/attendance.dart';
import 'package:rjc/views/sub_views/timetable.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Resources r = new Resources(); // Resources

  User user = new User(
      name: 'Dhritiman Roy', roll: 19200852, stream: 'ECE', section: 'A');

  Size ds = Size(0.0, 0.0);

  // ---------------------- USING -----------------------

  Widget _infoContainer(User user) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: r.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Table(
          children: [
            TableRow(
              children: [
                Row(
                  children: <Widget>[
                    Text('Name: ',
                        style: r.style(r.black, 14, r.f3, isBold: true)),
                    Text(user.name,
                        style: r.style(r.black, 14, r.f3, isBold: false)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Roll: ',
                        style: r.style(r.black, 14, r.f3, isBold: true)),
                    Text(user.roll.toString(),
                        style: r.style(r.black, 14, r.f3, isBold: false)),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                Row(
                  children: <Widget>[
                    Text('Stream: ',
                        style: r.style(r.black, 14, r.f3, isBold: true)),
                    Text(user.stream,
                        style: r.style(r.black, 14, r.f3, isBold: false)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Section: ',
                        style: r.style(r.black, 14, r.f3, isBold: true)),
                    Text(user.section,
                        style: r.style(r.black, 14, r.f3, isBold: false)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String title, Color color, bool isLeft, Widget widget) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          if (widget != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget,
              ),
            );
          } else {
            setState(() {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Feature coming soon')));
            });
          }
        },
        child: Container(
          height: (ds.height / 6) + 20,
          margin: EdgeInsets.only(
              left: isLeft ? 20 : 10, right: isLeft ? 10 : 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 4), blurRadius: 8),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: r.style(Colors.white, 14, r.f3, isBold: true),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: r.bgColor,
      appBar: r.appBar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: _infoContainer(user),
          ),
          Container(
            child: Table(
              children: [
                TableRow(children: [
                  Container(
                      child: _button(
                          'Attendance', Colors.blue, true, AttendancePage())),
                  Container(
                      child: _button(
                          'Time Table', Colors.green, false, TimeTablePage())),
                ]),
                TableRow(children: [
                  Container(
                      child: _button('Announcements', Colors.purple, true,
                          AnnouncementsPage())),
                  Container(
                      child: _button('Assignments', Colors.red, false, null)),
                ]),
                TableRow(children: [
                  Container(
                      child: _button(
                          'Exam Results', Colors.yellow[600], true, null)),
                  Container(
                      child: _button(
                          'Time Table', Colors.green[700], false, null)),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
