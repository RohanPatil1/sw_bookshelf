import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'Shelf.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Shelf", home: Main()));

class Main extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Shelf();
            },
            itemExtent: SizeConfig.blockSizeVertical*24,
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}