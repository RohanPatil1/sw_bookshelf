import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/bookcover.jpg"),
        ),
      ),
    );
  }
}
