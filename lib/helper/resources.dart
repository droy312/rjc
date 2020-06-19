import 'package:flutter/material.dart';

class Resources {
  // Colors
  Color bgColor = Colors.white;
  Color black = Color.fromRGBO(50, 50, 50, 1);

  // Fonts
  String f1 = 'Poppins';
  String f2 = 'PoppinsBold';
  String f3 = 'Roboto';
  String f4 = 'RobotoBold';

  // TextStyle
  TextStyle style(Color color, double size, String font, {isBold = false}) {
    return TextStyle(
      fontFamily: font,
      fontSize: size,
      color: color,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: bgColor,
      title: Text('R.J. COLLEGE', style: style(black, 18, f3, isBold: true)),
      centerTitle: true,
    );
  }
}
