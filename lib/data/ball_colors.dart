
import 'package:flutter/material.dart';

class BallColors{
  static MaterialColor one = Colors.orange;
  static MaterialColor ten = Colors.blue;
  static MaterialColor twenty = Colors.red;
  static MaterialColor thirty = Colors.grey;
  static MaterialColor fourty = Colors.green;

  static Color ballColor;

  static Color getBallColor(int index){
    int colorNum = ((index - 1) ~/ 10);
    if(colorNum == 0) ballColor = BallColors.one;
    else if(colorNum  == 1) ballColor = BallColors.ten;
    else if(colorNum  == 2) ballColor = BallColors.twenty;
    else if(colorNum  == 3) ballColor = BallColors.thirty;
    else if(colorNum  == 4) ballColor = BallColors.fourty;

    return ballColor;
  }
    
}