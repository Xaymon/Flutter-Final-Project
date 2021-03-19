import 'package:dbproject3it1/utility/my_style.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MyStyle().titleH1('Setting'),
            Text('This is Setting'),
          ],
        ),
      ),
    );
  }
}
