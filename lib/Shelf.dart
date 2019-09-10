import 'package:flutter/material.dart';
import 'package:sw_bookshelf/SizeConfig.dart';
import 'package:sw_bookshelf/Book.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Shelf", home: Shelf()));

class Shelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
                          return Container(
                            child: GestureDetector(
                              child: Book(),
                              onTap: () {
                                //Add Code
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
}
