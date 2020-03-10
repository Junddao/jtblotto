
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/services/database.dart';
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

  getLottoInfo(int drwCount){
    fetchLottoInfo(drwCount).then((value) {
      // setState(() {
        _liLottoInfo.addAll(value);  
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: lock.synchronized(getDBData),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasData == null) {
                return Container();
              }
              break;
            case ConnectionState.none:
              return Container(
                child: Center(
                  child: Text('none'),
                ),
              );
              break;
            case ConnectionState.active:
              return Container(
                child: Center(
                  child: Text('active'),
                ),
              );
              break;
            }
          
            return Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Text('번호별 당첨 횟수'),
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => InputPhoneNumber()));
                      },
                    ),
                  ),
              ],)
            );
          }
        ) 
    );
  }

  Future getDBData() async{
    _liLottoInfo = await Database.readData();
    getLottoInfo(_liLottoInfo.length);
  }

  Future<List<LottoInfo>> fetchLottoInfo(drwCount) async {

    var lottoInfos = List<LottoInfo>();
    int episode = drwCount;
    while(true){
      http.Response response = await http.get(url + episode.toString());
      var lottoJson = jsonDecode(response.body);
      LottoInfo info = LottoInfo.fromJson(lottoJson);
      if(info.returnValue.contains('fail')){
        break;
      }
      else{
        Database.createData(info);
        lottoInfos.add(info);
        
        episode++;
      }
    }
    
    return lottoInfos;
  }
}