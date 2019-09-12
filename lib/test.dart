import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'Shelf.dart';
import 'bookserver.dart';
import 'Book.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Shelf", home: test1234()));


class test1234 extends StatefulWidget{

  @override
  test createState() => test();
}

class test extends State<test1234>{

  List<Map<String,String>> data = bookServer.getData();

  List<String> images = new List<String>();

  int index1=0;

  @override
  void initState() {
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, position) {

                return Shelf();
              },
              itemExtent: SizeConfig.blockSizeVertical*24,
              itemCount: 4,
            ),
//      Padding(
//        padding: const EdgeInsets.only(top:20),
//        child:

      Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10),
        child: GridView.builder(
                            itemCount: images.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1/2,
                              crossAxisCount: 3,
                                crossAxisSpacing: SizeConfig.safeBlockHorizontal*20,
                                mainAxisSpacing: SizeConfig.blockSizeVertical*5,
                            ),
                            itemBuilder: (BuildContext context, int index) {

                              return Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Container(
                                  child: GestureDetector(
                                    child: Book(images[getIndex(index)]),
                                    onTap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          child: new CupertinoAlertDialog(
                                            title: new Column(
                                              children: <Widget>[
                                                new Text("Subject: "+data.elementAt(index)['subName']),
                                              ],
                                            ),
                                            content: new Text("Subject Code: "+data.elementAt(index)['subCode']),
                                            actions: <Widget>[
                                              new FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: new Text("OK"))
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              );
                            }),
      ),
  //    ),
          ],
        ),
      ),
    );
  }

  void getImages(){
    data.forEach((Map<String,String> samp) => (
        images.add(samp['image'])
    ));
    data.forEach((Map<String,String> samp) => (
        samp.remove('image')
    ));
  }

  int getIndex(index){
    if(index<images.length)
    {
      return index++;
    }
    else{
      return 0;
    }
  }
}