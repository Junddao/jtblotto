import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/data/ball_colors.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/data/number_of_counter.dart';
import 'package:jtblotto/services/myadshelper.dart';
import 'package:provider/provider.dart';

class CalcurateNumber extends StatefulWidget {
  @override
  _CalcurateNumberState createState() => _CalcurateNumberState();
}

class _CalcurateNumberState extends State<CalcurateNumber> {

  List<int> numbers = [0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getNumbers(numbers[0]) ,
              getNumbers(numbers[1]) ,
              getNumbers(numbers[2]) ,
              getNumbers(numbers[3]) ,
              getNumbers(numbers[4]) ,
              getNumbers(numbers[5]) ,
          ],),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              
          ],),
        ),
        Padding(
          padding: EdgeInsets.all(1),
            child: FlatButton(
            //color: Colors.amber[300],
            child: Text('완전 랜덤'),
            onPressed: () {
              getRandomNumber(6);
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1),
            child: FlatButton(
            //color: Colors.pink[300],
            child: Text('Junddao AI 추천 #1'),
            onPressed: () {
              getManySelectedRecommandNumber();
              setState(() {});
            },
          ),
        ),
          Padding(
          padding: EdgeInsets.all(1),
            child: FlatButton(
            //color: Colors.blue[300],
            child: Text('Junddao AI 추천 #2'),
            onPressed: () {
              getaLittleSelectedRecommandNumber();
              setState(() {});
            },
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Ads.showBanner(),
      ],),
    );
  } 
  


  getRandomNumber(int quantity){
    int position = 0;
    initArray(numbers);
    while(true)
    {
      bool isDuplicate = false;
      int temp = new Random().nextInt(46);
      for (var i = 0 ; i < quantity; i++){
       
        if(numbers[i] == temp){
            isDuplicate = true;
        }
      }
      if(isDuplicate == false && temp != 0)
      {
        numbers[position] = temp;
        position++;
      }
      if(position > quantity - 1){
        break;
      }
    }
    numbers.sort();
  }

  getRandom4Number(List<int> recommandNumber){
    int position = 0;
    initArray(numbers);
    numbers[4] = recommandNumber[0];
    numbers[5] = recommandNumber[1];
    while(true)
    {
      bool isDuplicate = false;
      int temp = new Random().nextInt(46);
      for (var i = 0 ; i < 4; i++){
       
        if(numbers[i] == temp || numbers[4] == temp || numbers[5] == temp){
            isDuplicate = true;
        }
      }
      if(isDuplicate == false && temp != 0)
      {
        numbers[position] = temp;
        position++;
      }
      if(position == 4 ){
        break;
      }
    }
    numbers.sort();
  }



  getManySelectedRecommandNumber(){
    List<NumberOfCounter> liRecommand = new List<NumberOfCounter>();
    liRecommand.addAll(Provider.of<LottoInfos>(context, listen: false).top6Num);
    var recommandNumber = List<int>.generate(2, (index) => 0);  
     while(true){
      recommandNumber[0] = liRecommand[Random().nextInt(liRecommand.length)].number;
      recommandNumber[1] = liRecommand[Random().nextInt(liRecommand.length)].number;
      if(recommandNumber[0] != recommandNumber[1]) break;
    }
    getRandom4Number(recommandNumber);
    numbers.sort();
  }

  getaLittleSelectedRecommandNumber(){
    List<NumberOfCounter> liRecommand = new List<NumberOfCounter>();
    liRecommand.addAll(Provider.of<LottoInfos>(context, listen: false).top6Num);
    liRecommand.addAll(Provider.of<LottoInfos>(context, listen: false).notSelctedNum);
    var recommandNumber = List<int>.generate(2, (index) => 0);  
     while(true){
      recommandNumber[0] = liRecommand[Random().nextInt(liRecommand.length)].number;
      recommandNumber[1] = liRecommand[Random().nextInt(liRecommand.length)].number;
      if(recommandNumber[0] != recommandNumber[1]) break;
    }
    getRandom4Number(recommandNumber);
    numbers.sort();
  }

  void initArray(List temp){
    for(int i = 0 ; i < temp.length; i++){
      temp[i] = 0;
    }
  }

  Widget getNumbers(int index){

    return CircleAvatar(
      backgroundColor: BallColors.getBallColor(index),
      radius: 14,
      child: Text(index.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
    );  
  }
  
}