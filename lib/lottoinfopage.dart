
import 'package:flutter/material.dart';
import 'package:jtblotto/data/lottoinfo.dart';
    
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jtblotto/data/lottoinfo.dart';


class LottoInfoPage extends StatefulWidget {
  @override
  _LottoInfoPageState createState() => _LottoInfoPageState();
}

class _LottoInfoPageState extends State<LottoInfoPage> {

  List<LottoInfo> _liLottoInfo = List<LottoInfo>();

  final String url = 'https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=';
  final String drwNo = '1';

  

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    fetchLottoInfo().then((value) {
      setState(() {
        _liLottoInfo.addAll(value);  
      });
    });
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
    http.Response response = await http.get(url + drwNo);
    // List<LottoInfo> posts = jsonDecode(response.body).map<LottoInfo>((item) => LottoInfo.fromJson(item)).toList();
    var lottoJson = jsonDecode(response.body);
    for(var json in lottoJson){
      lottoInfos.add(LottoInfo.fromJson(json));
    }
    return lottoInfos;
  }
}