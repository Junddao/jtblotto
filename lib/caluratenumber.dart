import 'dart:math';

import 'package:flutter/material.dart';

class CalurateNumber extends StatefulWidget {
  @override
  _CalurateNumberState createState() => _CalurateNumberState();
}

class _CalurateNumberState extends State<CalurateNumber> {

  var numbers = [0, 0, 0, 0, 0, 0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Lotto'),
      ),
      body: Column(children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              Text(numbers[0].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[1].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[2].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[3].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[4].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[5].toString(), style: TextStyle(fontSize: 20),),
             
          ],),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              
          ],),
        ),
        Expanded(
          flex: 1,
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getNumber();
                setState(() {
                  
                });
              },
            ),
          ),
           Spacer(
          flex: 1,
        ),
      ],),
    );
  }

  getNumber(){
    int position = 0;
    
    while(true)
    {
      bool isDuplicate = false;
      int temp = new Random().nextInt(46);
      for (var i = 0 ; i < 6; i++){
       
        if(numbers[i] == temp){
            isDuplicate = true;
          }
      }
      if(isDuplicate == false && temp != 0)
      {
        numbers[position] = temp;
        position++;
      }
      
      if(position > 5){
        break;
      }
    }
   
    numbers.sort();
  }
  
}