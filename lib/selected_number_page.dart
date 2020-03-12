import 'package:flutter/material.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:provider/provider.dart';

class SelectedNumberPage extends StatefulWidget {
  @override
  _SelectedNumberPageState createState() => _SelectedNumberPageState();
}

class _SelectedNumberPageState extends State<SelectedNumberPage> {

  List<int> _liNumbers = new List.generate(46, (index) => 0);
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMostSelectedNumber();
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _liNumbers.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index % 3]],
            child: Row(
              children: <Widget>[
                Expanded(
                  child: getNumbers(index),
                ),
            ],)
          );
        }
      ),
    );
  }

  Widget getNumbers(int index){
    return Text(index.toString() + _liNumbers[index].toString());
  }
}