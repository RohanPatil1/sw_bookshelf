import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class Book extends StatelessWidget {

  String imagePath;

  Book(imagePath){
    this.imagePath = imagePath;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
