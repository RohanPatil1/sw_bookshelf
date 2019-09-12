import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sw_bookshelf/SizeConfig.dart';
import 'package:sw_bookshelf/Book.dart';


class Shelf extends StatefulWidget {

  List<Map<String,String>> subdata;

  Shelf(data){
    subdata = data;
  }


  @override
  bookShelf createState() => bookShelf(subdata);

}


class bookShelf extends State<Shelf> {

  List<Map<String,String>> subData;

  bookShelf(subdata){
    subData = subdata;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(subData!=null){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 3,
                height: SizeConfig.blockSizeVertical * 22,
                color: Colors.brown[800],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 94,
                    height: SizeConfig.blockSizeVertical * 21,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/background.jpeg")),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: GridView.builder(
                          itemCount: 3,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing:
                              SizeConfig.blockSizeHorizontal * 2),
                          itemBuilder: (BuildContext context, int index) {
                            //print(imgPaths);
                            return Container(
                              child: GestureDetector(
                                child: Book(subData[index]['image']),
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      child: new CupertinoAlertDialog(
                                        title: new Column(
                                          children: <Widget>[
                                            new Text("Subject: "+subData[index]['subName']),
                                          ],
                                        ),
                                        content: new Text("Subject Code: "+subData[index]['subCode']),
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
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 94,
                    height: SizeConfig.blockSizeVertical * 1,
                    color: Colors.brown[800],
                  ),
                ],
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 3,
                height: SizeConfig.blockSizeVertical * 22,
                color: Colors.brown[800],
              ),
            ],
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/background.jpeg")),
            ),
          ),
        ],
      );
    }
    else{
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 3,
                height: SizeConfig.blockSizeVertical * 22,
                color: Colors.brown[800],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 94,
                    height: SizeConfig.blockSizeVertical * 21,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/background.jpeg")),
                    ),
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 94,
                    height: SizeConfig.blockSizeVertical * 1,
                    color: Colors.brown[800],
                  ),
                ],
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 3,
                height: SizeConfig.blockSizeVertical * 22,
                color: Colors.brown[800],
              ),
            ],
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/background.jpeg")),
            ),
          ),
        ],
      );
    }
  }
}
