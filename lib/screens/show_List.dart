import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbproject3it1/models/Av_model.dart';
import 'package:dbproject3it1/screens/show_video.dart';
import 'package:dbproject3it1/utility/my_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  double screen;

  List<Widget> widgets = [];
  List<AvModel> avModels = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }
  
  Future<Null> readData() async{
    await Firebase.initializeApp().then((value) async{
      print('initialize Success');
      await FirebaseFirestore.instance.collection('AV').orderBy('name')
          .snapshots().listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs){
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          AvModel model = AvModel.fromMap(map);
          avModels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(AvModel model, int index) => GestureDetector(
    onTap: () {
      print('You Click from index = $index');
      Navigator.push(context,
          MaterialPageRoute(builder: (context)
          => ShowVideo(avModel: avModels[index],
      ),
          ));
    },
    child: Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              //height: 189,
              // width: 115,
              height: screen * 0.4,
                child: Image.network(model.cover)
            ),
            SizedBox(
              height: 5,
            ),
            MyStyle().titleH2(model.name),
          ],
        ),
      ),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(
        maxCrossAxisExtent: 220,
        children: widgets,
      ),
    );
  }
}
