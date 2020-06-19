import 'package:flutter/material.dart';
import 'package:rjc/helper/resources.dart';

class AnnouncementsPage extends StatefulWidget {
  AnnouncementsPage({Key key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  Resources r = new Resources();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: r.bgColor,
      appBar: r.appBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
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
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      border: Border.all(color: r.black, width: 1),
                    ),
                    child: Text('Announcements',
                        style: r.style(Colors.white, 14, r.f3)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
