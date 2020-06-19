import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rjc/helper/resources.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  static Resources r = new Resources();

  double attendancePercent = null;

  static List isDropDowned = List.filled(4, false);
  static List containerHeights = List.filled(4, 0.0);
  static List headers = [
    'Maths',
    'Physics',
    'Electronics',
    'English',
  ];

  // ---------------- USING ------------------

  Widget attendance() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: r.black,
      ),
      child: Center(
        child: Text('Attendance: ' + attendancePercent.toString(),
            style: r.style(Colors.white, 14, r.f3)),
      ),
    );
  }

  Widget monthWiseBtn() {
    return RaisedButton(
      onPressed: () {},
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text('Month Wise', style: r.style(Colors.white, 14, r.f3)),
      ),
    );
  }

  Widget dropDownListWidget(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(bottom: BorderSide(color: r.black, width: 1)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    isDropDowned[index] = !isDropDowned[index];
                    if (containerHeights[index] == 0.0)
                      containerHeights[index] = 120.0;
                    else
                      containerHeights[index] = 0.0;
                  });
                },
                icon: isDropDowned[index]
                    ? Icon(Icons.keyboard_arrow_down, color: Colors.grey[700])
                    : Icon(Icons.keyboard_arrow_right, color: Colors.grey[700]),
              ),
              SizedBox(width: 10),
              Text(headers[index], style: r.style(Colors.grey[700], 14, r.f3)),
            ],
          ),
          Container(
            height: containerHeights[index],
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(  
                    border: Border(bottom: BorderSide(color: r.black, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: Text('No of lectures: ',
                      style: r.style(r.black, 14, r.f3)),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(  
                    border: Border(bottom: BorderSide(color: r.black, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: Text('No of lectures attended: ',
                      style: r.style(r.black, 14, r.f3)),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(  
                    border: Border(bottom: BorderSide(color: r.black, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: Text('Attendance: ',
                      style: r.style(r.black, 14, r.f3)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subjectWiseAttendance() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: r.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: r.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              border: Border.all(color: r.black, width: 1),
            ),
            child: Text('Subject wise attendance',
                style: r.style(Colors.white, 14, r.f3)),
          ),
          SizedBox(
            child: Column(
              children: <Widget>[
                dropDownListWidget(0),
                dropDownListWidget(1),
                dropDownListWidget(2),
                dropDownListWidget(3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: r.bgColor,
      appBar: r.appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              attendance(),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: monthWiseBtn(),
              ),
              subjectWiseAttendance(),
            ],
          ),
        ),
      ),
    );
  }
}
