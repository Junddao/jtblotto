import 'package:flutter/material.dart';
import 'package:jtblotto/data/ball_colors.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:provider/provider.dart';

class NotSelectedNumber extends StatefulWidget {
  @override
  _NotSelectedNumberState createState() => _NotSelectedNumberState();
}

class _NotSelectedNumberState extends State<NotSelectedNumber> {

 
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('15주 미출현 번호'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text('15주 미출현 번호', textAlign: TextAlign.center,),
          ),
          Container(
            child: getNotSelectedNum(),
          ),

          
        ],
      )
      
    );
  }
  


  Widget getNotSelectedNum(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(Provider.of<LottoInfos>(context, listen: false).notSelctedNum.length, (index){
        return getNum(index);
      }),
    );
  }

  Widget getNum(int index){
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child : CircleAvatar(
        backgroundColor: BallColors.getBallColor(Provider.of<LottoInfos>(context, listen: false).notSelctedNum[index].number),
        radius: 14,
        child: Text(Provider.of<LottoInfos>(context, listen: false).notSelctedNum[index].number.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ), 
      );  
  }

}