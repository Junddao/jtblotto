import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/data/ball_colors.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/data/number_of_counter.dart';
import 'package:jtblotto/data/sixnumbers.dart';
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
          child: getNumbers() ,
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
              //setState(() {});
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1),
            child: FlatButton(
            //color: Colors.pink[300],
            child: Text('AI 추천 #1 (많이 나온 번호)'),
            onPressed: () {
              getManySelectedRecommandNumber();
              //setState(() {});
            },
          ),
        ),
          Padding(
          padding: EdgeInsets.all(1),
            child: FlatButton(
            //color: Colors.blue[300],
            child: Text('AI 추천 #2 (적게 나온 번호)'),
            onPressed: () {
              getaLittleSelectedRecommandNumber();
              //setState(() {});
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
    Provider.of<SixNumbers>(context, listen: false).setNumbers(numbers);
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
    Provider.of<SixNumbers>(context, listen: false).setNumbers(numbers);
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
    Provider.of<SixNumbers>(context, listen: false).setNumbers(numbers);
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
    Provider.of<SixNumbers>(context, listen: false).setNumbers(numbers);
  }

  void initArray(List temp){
    for(int i = 0 ; i < temp.length; i++){
      temp[i] = 0;
    }
  }

  Widget getNumbers(){
    //List<int> value.getNumbers() = Provider.of<SixNumbers>(context).getNumbers();
    return Consumer<SixNumbers>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[0]),
            radius: 14,
            child: Text(value.getNumbers()[0].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[1]),
            radius: 14,
            child: Text(value.getNumbers()[1].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[2]),
            radius: 14,
            child: Text(value.getNumbers()[2].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[3]),
            radius: 14,
            child: Text(value.getNumbers()[3].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[4]),
            radius: 14,
            child: Text(value.getNumbers()[4].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
          CircleAvatar(
            backgroundColor: BallColors.getBallColor(value.getNumbers()[5]),
            radius: 14,
            child: Text(value.getNumbers()[5].toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}