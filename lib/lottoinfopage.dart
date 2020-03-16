
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/notselectednumber.dart';
import 'package:jtblotto/selected_number_page.dart';
import 'package:jtblotto/services/database.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';



class LottoInfoPage extends StatefulWidget {
  @override
  _LottoInfoPageState createState() => _LottoInfoPageState();
}

class _LottoInfoPageState extends State<LottoInfoPage> {

  List<LottoInfo> _liLottoInfo = List<LottoInfo>();
  int mostSelectedNum = 0;


  var dbHelper;
  var lock = new Lock();

  final String url = 'https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=';
  final String drwNo = '1';

  @override
  void initState() {
    super.initState();
    
  }

  // getLottoInfo(int drwCount){
  //   fetchLottoInfo(drwCount).then((value) {
  //     // setState(() {
  //       Provider.of<LottoInfos>(context, listen: false).liLottoInfos.addAll(value);  
  //     // });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber[300],
                      height: 50,
                      child: FlatButton(
                        child: Text('번호별 당첨 횟수'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedNumberPage()));
                        },
                      ),
                    ),
                  ),  
                  Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.amber[300],
                      height: 50,
                      child: FlatButton(
                        child: Text('15주간 미출현 번호'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotSelectedNumber()));
                        },
                      ),
                    ),
                  ),  
                ],
              ),
      ),
    );
  }

  // Future getDBData() async{
  //   _liLottoInfo = await Database.readData();
  //   Provider.of<LottoInfos>(context, listen: false).copyLottoInfo(_liLottoInfo);
  //   getLottoInfo(Provider.of<LottoInfos>(context, listen: false).liLottoInfos.length);
     
  // }

  // Future<List<LottoInfo>> fetchLottoInfo(drwCount) async {

  //   var lottoInfos = List<LottoInfo>();
  //   int episode = drwCount;
  //   while(true){
  //     http.Response response = await http.get(url + episode.toString());
  //     var lottoJson = jsonDecode(response.body);
  //     LottoInfo info = LottoInfo.fromJson(lottoJson);
  //     if(info.returnValue.contains('fail')){
  //       break;
  //     }
  //     else{
  //       Database.createData(info);
  //       Provider.of<LottoInfos>(context, listen: false).addLottoInfo(info);
        
  //       episode++;
  //     }
  //   }
    
  //   return lottoInfos;
  // }
}