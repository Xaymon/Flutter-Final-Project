import 'package:dbproject3it1/utility/my_style.dart';
import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String string)async{
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: Image.asset('images/One.jpg'),
          title: Text('Normal Dialog',
              style: MyStyle().redBoldStyle(),
          ),
          subtitle: Text(string),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
          ),
        ],
      ),
  );
}