import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:jtblotto/data/lottoinfo.dart';

class Database{
  static Future<void> createData(LottoInfo lottoInfo) async{
    FirebaseDatabase.instance.reference()
        .child('lottoRecord').child(lottoInfo.drwNo.toString())
        .set({
      'totSellamnt'    : lottoInfo.totSellamnt,
      'drwNo'          : lottoInfo.drwNo,
      'returnValue'    : lottoInfo.returnValue,
      'drwNoDate'      : lottoInfo.drwNoDate,
      'firstWinamnt'   : lottoInfo.firstWinamnt,
      'firstPrzwnerCo' : lottoInfo.firstPrzwnerCo,
      'firstAccumamnt' : lottoInfo.firstAccumamnt,
      'drwtNo1'        : lottoInfo.drwtNo1,
      'drwtNo2'        : lottoInfo.drwtNo2,
      'drwtNo3'        : lottoInfo.drwtNo3,
      'drwtNo4'        : lottoInfo.drwtNo4,
      'drwtNo5'        : lottoInfo.drwtNo5,
      'drwtNo6'        : lottoInfo.drwtNo6,
      'bnusNo'         : lottoInfo.bnusNo,
    });
  }

  static Future<List<LottoInfo>> readData() async{
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    List<LottoInfo> liLottoInfo = List<LottoInfo>();
    try{
      await ref.child('lottoRecord').once().then((DataSnapshot snap) {
        var datas = snap.value;
        for (var data in datas) {
          if(data != null){
          LottoInfo d = new LottoInfo(
              data['totSellamnt'],
              data['drwNo'],
              data['returnValue'],
              data['drwNoDate'],
              data['firstWinamnt'],  
              data['firstPrzwnerCo'],
              data['firstAccumamnt'],
              data['drwtNo1'],
              data['drwtNo2'],
              data['drwtNo3'],
              data['drwtNo4'],
              data['drwtNo5'],
              data['drwtNo6'],
              data['bnusNo']);

              liLottoInfo.add(d);
          }
        }
      });
      //return liLottoInfo;
    }
    catch(Exception){
      print('aaa');
    }
    return liLottoInfo;
    
  }
  
}