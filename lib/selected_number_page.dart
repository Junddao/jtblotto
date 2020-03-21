import 'package:flutter/material.dart';
import 'package:jtblotto/data/ball_colors.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/data/number_of_counter.dart';
import 'package:provider/provider.dart';

class SelectedNumberPage extends StatefulWidget {
  @override
  _SelectedNumberPageState createState() => _SelectedNumberPageState();
}

class _SelectedNumberPageState extends State<SelectedNumberPage> {
  
  List<NumberOfCounter> sixNum;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('번호별 당첨횟수'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(children: <Widget>[
              Text('많이 나온 번호 Top 6', textAlign: TextAlign.center,),
              getTop6Number(),
            ],),
          ),
           Container(
            height: 50,
            child: Row(children: <Widget>[
              Text('적게 나온 번호 Top 6', textAlign: TextAlign.center,),
              getBottom6Number(),
            ],),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Expanded(
                  child: Text('번호', textAlign: TextAlign.center,),
                  flex: 2,
                ),
                Expanded(
                  child: Text('당첨횟수', textAlign: TextAlign.center,),
                  flex: 8,
                ),
                
                
              ],),
          ),

          Divider(
            thickness: 1,
          ),  
          
         
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey,),
              itemCount: Provider.of<LottoInfos>(context, listen: false).liNumbers.length - 1,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: getNumbers(index + 1),
                        flex: 2,
                      ),
                      Expanded(
                        child: getCount(index + 1),
                        flex: 8,
                      ),
                      
                  ],)
                );
              }
            ),
          ),
          
        ],
      )
      
    );
  }

  Widget getTop6Number(){
    

    sixNum = Provider.of<LottoInfos>(context, listen: false).top6Num;
    return Row(
      children: List.generate(sixNum.length, (index){
        return get6Num(index);
      }),
    );
  }

  Widget getBottom6Number(){
    
    sixNum = Provider.of<LottoInfos>(context, listen: false).bottom6Num;
    return Row(
      children: List.generate(sixNum.length, (index){
        return get6Num(index);
      }),
    );
  }

  Widget get6Num(int index){
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child : CircleAvatar(
        backgroundColor: BallColors.getBallColor(sixNum[index].number),
        radius: 14,
        child: Text(sixNum[index].number.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ), 
      );  
  }

  Widget getNumbers(int index){

    return CircleAvatar(
      backgroundColor: BallColors.getBallColor(index),
      radius: 14,
      child: Text(index.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
    );  
  }
  Widget getCount(int index){
    return Text(Provider.of<LottoInfos>(context, listen: false).liNumbers[index].toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 18),);
  }
}