
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/data/listmodel.dart';
import 'package:jtblotto/data/lottoinfo.dart';
    
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/services/database.dart';
import 'package:jtblotto/services/dbhelper.dart';


class LottoInfoPage extends StatefulWidget {
  @override
  _LottoInfoPageState createState() => _LottoInfoPageState();
}

class _LottoInfoPageState extends State<LottoInfoPage> {

  List<LottoInfo> _liLottoInfo = List<LottoInfo>();
  List<ListItem> _listItems = List<ListItem>();
  var dbHelper;
  

  final String url = 'https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=';
  final String drwNo = '1';

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    getLottoInfo();
  }

  getLottoInfo(){
    fetchLottoInfo().then((value) {
      setState(() {
        _liLottoInfo.addAll(value);  
      });
    });
  }

  refreshList() {
    setState(() {
      _listItems = dbHelper.getListItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.builder(
        itemCount: _liLottoInfo.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_liLottoInfo[index].returnValue),
            onTap: () {},
          );
        },
      ),
    );
  }

  Future<List<LottoInfo>> fetchLottoInfo() async {

    var lottoInfos = List<LottoInfo>();
    int episode = 1;
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