
import 'package:dbproject3it1/screens/my%20service.dart';
import 'package:dbproject3it1/screens/register.dart';
import 'package:flutter/material.dart';
import 'screens/authen.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen':(BuildContext context) => Authen(),
  '/register' :(BuildContext context) => Register(),
  '/myService' :(BuildContext context) => MyService(),
};