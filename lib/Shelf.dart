import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sw_bookshelf/SizeConfig.dart';
import 'screen.dart';


class Shelf extends StatelessWidget {

  List<Map<String,String>> subData;

  Shelf(datalist){
    subData = datalist;
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
                                child: Container(
                              decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(subData[index]["image"]),
                              ),
                            ),
                                ),
                                onTap: ()  {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UI(
                                    subject: subData[index]["subName"],
                                    SubjectCode: subData[index]["subCode"],
                                  )));
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
