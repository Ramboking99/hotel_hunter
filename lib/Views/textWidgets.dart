import 'package:flutter/material.dart';

class AppBarTexts extends StatelessWidget {

 final String text;

 AppBarTexts({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25.0,
      ),
    );
  }

}