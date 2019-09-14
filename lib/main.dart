import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'Shelf.dart';
import 'bookserver.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        builder: (_)=>bookServer(),
      )
    ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false, title: "Shelf", home: myApp()),
  ));




class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return  SafeArea(
        child: Scaffold(
          body: Container(
            child: ListView.builder(
              itemBuilder: (context, position) {
                // if(position<data.length/3){
                //   int start = 2*position+position;
                //   int end = start+3;
                //   return Shelf(data.sublist(start,end));
                // }
                // else{
                  return Shelf();
                // }
              },
              itemExtent: SizeConfig.blockSizeVertical*24,
              itemCount: 5,
            ),
          ),
        ),
      );
    
  }
}