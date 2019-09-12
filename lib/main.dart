import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'Shelf.dart';
import 'bookserver.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Shelf", home: Main()));

class Main extends StatefulWidget{

  myApp createState() => myApp();
}


class myApp extends State<Main>{

  List<Map<String,String>> data = bookServer.getData();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, position) {
              if(position<data.length/3){
                int start = 2*position+position;
                int end = start+3;
                return Shelf(data.sublist(start,end));
              }
              else{
                return Shelf(null);
              }
            },
            itemExtent: SizeConfig.blockSizeVertical*24,
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}