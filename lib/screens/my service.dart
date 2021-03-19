import 'package:dbproject3it1/screens/Profile.dart';
import 'package:dbproject3it1/screens/Setting.dart';
import 'package:dbproject3it1/screens/show_List.dart';
import 'package:dbproject3it1/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {

  String name, email;
  Widget currentWidget = ShowList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async{
    await Firebase.initializeApp().then((value) async{
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildListTileShowList(),
              SizedBox(height: 5,),
              buildListProfile(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildListTileShowList() {
    return ListTile(
      leading: Icon(Icons.home, size: 30,),
      title: Text('Home', style: TextStyle(fontSize: 20),),
      tileColor: MyStyle().lightColor,
      // subtitle: Text('Show All AV in my Stock'),
      onTap: () {
        setState(() {
          currentWidget = ShowList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListProfile() {
    return ListTile(
      leading: Icon(Icons.person_outline, size: 30,),
      title: Text('Profile', style: TextStyle(fontSize: 20),),
      tileColor: MyStyle().lightColor,
      // subtitle: Text('Show All AV in my Stock'),
      onTap: () {
        setState(() {
          currentWidget = Profile();
        });
        Navigator.pop(context);
      },
    );
  }

  // ListTile buildListTileShowList() {
  //   return ListTile(
  //               leading: Icon(Icons.arrow_forward),
  //               title: Text('Show List'),
  //               subtitle: Text('Show All AV in my Stock'),
  //     onTap: () {
  //                 setState(() {
  //                   currentWidget = ShowList();
  //                 });
  //                 Navigator.pop(context);
  //     },
  //             );
  // }


  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Wall2.png'),
                fit: BoxFit.cover)
            ),
              accountName: MyStyle().titleH2White(name == null ? 'Name' : name),
              accountEmail: MyStyle().titleH3White(email == null ? 'email' : email),
            currentAccountPicture: Image.asset('images/images.png'),
          );
  }

  Column buildSignOut() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            onTap: () async{
              await Firebase.initializeApp().then((value) async{
                await FirebaseAuth.instance
                    .signOut().then((value) =>
                    Navigator.pushNamedAndRemoveUntil(context, '/authen', (route) => false));
              });
            },
            tileColor: MyStyle().darkColor,
            leading: Icon(Icons.exit_to_app, color: Colors.white, size: 36,),
            title: MyStyle().titleH2White('Sign Out'),
            // subtitle: MyStyle().titleH3White('Sign Out & Go to Authen'),
          ),
        ],
      );
  }
}
