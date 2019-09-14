import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sw_bookshelf/SizeConfig.dart';
import 'package:provider/provider.dart';
import 'screen.dart';
import 'bookserver.dart';

class Shelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<bookServer>(context, listen: true);

    SizeConfig().init(context);

    return (booksProvider.state == LoadingState.loading)
        ? optionWidget()
        : Column(
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
                          child: Consumer<bookServer>(
                              builder: (context, bookserver, _) {
                            return GridView.builder(
                                itemCount: bookserver.dataList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                            image: AssetImage(bookserver
                                                .dataList[index]["image"]),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UI(
                                         subject: bookserver.dataList[index]["subName"],
                                         SubjectCode: bookserver.dataList[index]["subCode"],
                                       )));
                                      },
                                    ),
                                  );
                                });
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
                      fit: BoxFit.fill,
                      image: AssetImage("assets/background.jpeg")),
                ),
              ),
            ],
          );
  }

  Widget optionWidget() {
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
