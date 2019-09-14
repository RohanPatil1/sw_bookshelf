import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'Shelf.dart';
import 'package:sw_bookshelf/bookserver.dart';
import 'package:provider/provider.dart';

void main() => runApp( MultiProvider(
  providers: [
    ChangeNotifierProvider(
      builder: (_)=>bookServer(),
    )
  ],
  child: MaterialApp(
      debugShowCheckedModeBanner: false, title: "Shelf", home: Main()),
));

class Main extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final booksProvider = Provider.of<bookServer>(context, listen: true);

    SizeConfig().init(context);

    return (booksProvider.state == LoadingState.loading)
        ? optionWidget()
        :
    SafeArea(
      child: Scaffold(
        body: Container(
          child: Consumer<bookServer>(
        builder: (context, bookserver, _) {
          return
            ListView.builder(
              itemBuilder: (context, position) {
                if (position < bookserver.dataList.length / 3) {
                  int start = 2 * position + position;
                  int end = start + 3;
                  return Shelf(bookserver.dataList.sublist(start, end));
                }
                else {
                  return Shelf(null);
                }
              },
              itemExtent: SizeConfig.blockSizeVertical * 24,
              itemCount: 5,
            );
        },
    ),
        ),
      ),
    );
  }

  Widget optionWidget() {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Loading", style: TextStyle(
              fontSize: 30
            ),),
          ),
        )
    );
  }
}