
import 'dart:ui';

import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Color(0XFFc48b9f);
   Color primaryColor = Color(0XFFf8bbd0);
    Color lightColor = Color(0XFFffeeff);

    BoxDecoration boxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white60,
  );

  TextStyle redBoldStyle() => TextStyle(
        color: Colors.red.shade700,
        fontWeight: FontWeight.bold,
  );

  Widget showLogo() => Image.asset('images/Home2.png');

  Widget titleH1(string) => Text(
    string,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: darkColor,
    ),
  );

  Widget titleH2(string) => Text(
    string,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: darkColor,
    ),
  );

    Widget titleH2White(string) => Text(
    string,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  Widget titleH3(string) => Text(
    string,
    style: TextStyle(
      fontSize: 16,
      color: darkColor,
    ),
  );
    Widget titleH3White(string) => Text(
    string,
    style: TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
  );

  MyStyle();
}