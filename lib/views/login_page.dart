import 'package:flutter/material.dart';
import 'package:rjc/helper/resources.dart';
import 'package:rjc/views/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Resources r = new Resources();

  Size ds = Size(0.0, 0.0);
  // --------------- USING ---------------

  Widget _textBox() {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: r.style(r.black, 14, r.f3),
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: r.black, width: 0.8),
        ),
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      color: Colors.blue[600],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
      child: Center(
        child: Text('LOGIN',
            style: r.style(Colors.white, 14, r.f3, isBold: false)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: r.bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: _textBox(),
            ),
            Container(
              width: ds.width / 3,
              child: _loginBtn(context),
            ),
          ],
        ),
      ),
    );
  }
}
