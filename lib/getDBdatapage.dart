import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:jtblotto/data/number_of_counter.dart';
import 'package:jtblotto/services/database.dart';
import 'package:jtblotto/tabpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GetDBDataPage extends StatefulWidget {
  @override
  _GetDBDataPageState createState() => _GetDBDataPageState();
}

class _GetDBDataPageState extends State<GetDBDataPage> {

  
  List<int> _liNumbers = new List.generate(46, (index) => 0);
  List<int> _liNotSelectedNumbers = new List.generate(46, (index) => 0);
  List<NumberOfCounter> top6Num;
  List<NumberOfCounter> bottom6Num;
  List<NumberOfCounter> _liNotSelected = new List<NumberOfCounter>();
  List<NumberOfCounter> _liNumberOfCounter = new List<NumberOfCounter>();
  List<LottoInfo> _liLottoInfo = List<LottoInfo>();

  final String url = 'https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=';
  final String drwNo = '1';

  @override
  void initState() {
    
    super.initState();
    getDBData();
  }

  Future<void> getMostSelectedNumber() async{

    List<LottoInfo> lottoInfos = Provider.of<LottoInfos>(context, listen: false).liLottoInfos;
    for(LottoInfo lottoInfo in lottoInfos){
      _liNumbers[lottoInfo.drwtNo1]++;
      _liNumbers[lottoInfo.drwtNo2]++;
      _liNumbers[lottoInfo.drwtNo3]++;
      _liNumbers[lottoInfo.drwtNo4]++;
      _liNumbers[lottoInfo.drwtNo5]++;
      _liNumbers[lottoInfo.drwtNo6]++;
      _liNumbers[lottoInfo.bnusNo]++;
    }

    for(int i = 0; i < _liNumbers.length; i++){
      _liNumberOfCounter.add(NumberOfCounter(i, _liNumbers[i]));
    }
    Provider.of<LottoInfos>(context, listen: false).liNumbers = _liNumbers;
    
  }

  
  Future<void> getNotSelectedNumber() async{

    List<LottoInfo> lottoInfos = Provider.of<LottoInfos>(context, listen: false).liLottoInfos;
    for(int i = lottoInfos.length - 1 ; i > lottoInfos.length - 16; i--){
      LottoInfo lottoInfo = lottoInfos[i];
      _liNotSelectedNumbers[lottoInfo.drwtNo1]++;
      _liNotSelectedNumbers[lottoInfo.drwtNo2]++;
      _liNotSelectedNumbers[lottoInfo.drwtNo3]++;
      _liNotSelectedNumbers[lottoInfo.drwtNo4]++;
      _liNotSelectedNumbers[lottoInfo.drwtNo5]++;
      _liNotSelectedNumbers[lottoInfo.drwtNo6]++;
      _liNotSelectedNumbers[lottoInfo.bnusNo]++;
    }

    for(int i = 1; i < _liNotSelectedNumbers.length; i++){
      if(_liNotSelectedNumbers[i] == 0) _liNotSelected.add(NumberOfCounter(i, _liNotSelectedNumbers[i]));
    }
    Provider.of<LottoInfos>(context, listen: false).notSelctedNum = _liNotSelected;
  }


  Future getTop6Number() async{
    
    List<NumberOfCounter> temp = _liNumberOfCounter;
    temp.sort((a, b) => b.counter.compareTo(a.counter));
    top6Num = temp.sublist(0, 6);
    Provider.of<LottoInfos>(context, listen: false).top6Num = top6Num;
  }

  Future getBottom6Number() async{ 
    
    List<NumberOfCounter> temp = _liNumberOfCounter;
    temp.sort((a, b) => b.counter.compareTo(a.counter));
    bottom6Num = temp.sublist(39, 45);
    Provider.of<LottoInfos>(context, listen: false).bottom6Num = bottom6Num;
  }
  
  
  Future getLottoInfo(int drwCount) async{
    fetchLottoInfo(drwCount).then((value) {
      // setState(() {
        Provider.of<LottoInfos>(context, listen: false).liLottoInfos.addAll(value);  
      // });
    });
    getMostSelectedNumber();
    getNotSelectedNumber();
    getTop6Number();
    getBottom6Number();
  }

  Future getDBData() async{
    _liLottoInfo = await Database.readData();
    Provider.of<LottoInfos>(context, listen: false).copyLottoInfo(_liLottoInfo);
    await getLottoInfo(Provider.of<LottoInfos>(context, listen: false).liLottoInfos.length);
     
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
        Provider.of<LottoInfos>(context, listen: false).addLottoInfo(info);
        
        episode++;
      }
    }
    
    return lottoInfos;
  }

  

  @override
  Widget build(BuildContext context) {
    return TabPage();
  }
}