import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:jtblotto/data/lottoinfo.dart';

class Database{
  static Future<void> createData(LottoInfo lottoInfo) async{
    FirebaseDatabase.instance.reference().push()
        .child('lottoRecord').push()
        .set({
      'totSellamnt': lottoInfo.totSellamnt,
      'drwNo': lottoInfo.drwNo,
      'returnValue': lottoInfo.returnValue,
      'drwNoDate': lottoInfo.drwNoDate,
      'firstWinamnt': lottoInfo.firstWinamnt,
      'firstPrzwnerCo': lottoInfo.firstPrzwnerCo,
      'firstAccumamnt': lottoInfo.firstAccumamnt,
      'drwtNo1': lottoInfo.drwtNo1,
      'drwtNo2': lottoInfo.drwtNo2,
      'drwtNo3': lottoInfo.drwtNo3,
      'drwtNo4': lottoInfo.drwtNo4,
      'drwtNo5': lottoInfo.drwtNo5,
      'drwtNo6': lottoInfo.drwtNo6,
      'bnusNo': lottoInfo.bnusNo,
    });
  }

  // static Future<List<LottoInfo>> readData() async{
  //   DatabaseReference ref = FirebaseDatabase.instance.reference();
  //   try{
  //     await ref.child('lottoRecord').once().then((DataSnapshot snap) {
  //       var keys = snap.value.keys;
  //       var data = snap.value;
  //       for (var key in keys) {
  //         LottoInfo d = new LottoInfo(
  //             key,
  //             data[key]['date'],
  //             data[key]['senderPhoneNumber'],
  //             data[key]['senderName'],
  //             data[key]['receiverPhoneNumber'],
  //             data[key]['receiverName'],
  //             data[key]['savedPath'],
  //             data[key]['status'],
  //             data[key]['contents']);
  //         if (d.senderPhoneNumber == myPhoneNumber) {
  //           sentData.add(d);
  //         }
  //       }
  //     });
  //   }
  // }
  
}