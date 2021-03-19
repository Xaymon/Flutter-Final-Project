import 'package:dbproject3it1/router.dart';
import 'package:dbproject3it1/screens/authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dbproject3it1/screens/login.dart';
import 'package:dbproject3it1/screens/home.dart';

String initialRoute = '/authen';

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async{
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if(event != null){
        initialRoute = '/myService';
      }
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initialRoute,
      // initialRoute: '/',
      // routes: {
      //   '/' : (context) => Authen(),
      //   '/home' : (context) => Home(),
      // },
    );
  }
}
