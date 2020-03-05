

import 'package:json_annotation/json_annotation.dart';

part 'lottoinfo.g.dart';

@JsonSerializable()
class LottoInfo{
  final int totSellamnt;
  final int drwNo;
  final String returnValue;
  final String drwNoDate;
  final int firstWinamnt;
  final int firstPrzwnerCo;
  final int firstAccumamnt;
  final int drwtNo1;
  final int drwtNo2;
  final int drwtNo3;
  final int drwtNo4;
  final int drwtNo5;
  final int drwtNo6;
  final int bnusNo;

  LottoInfo(this.totSellamnt, this.drwNo, this.returnValue, this.drwNoDate, this.firstWinamnt, this.firstPrzwnerCo, this.firstAccumamnt, this.drwtNo1, this.drwtNo2, this.drwtNo3, this.drwtNo4, this.drwtNo5, this.drwtNo6, this.bnusNo);


  factory LottoInfo.fromJson(Map<String, dynamic> json) => _$LottoInfoFromJson(json);
 
  Map<String, dynamic> toJson() => _$LottoInfoToJson(this);

  
  Map<String, dynamic> toMap() => { 
     'totSellamnt': totSellamnt,
      'drwNo': drwNo,
      'returnValue': returnValue,
      'drwNoDate': drwNoDate,
      'firstWinamnt': firstWinamnt,
      'firstPrzwnerCo': firstPrzwnerCo,
      'firstAccumamnt': firstAccumamnt,
      'drwtNo1': drwtNo1,
      'drwtNo2': drwtNo2,
      'drwtNo3': drwtNo3,
      'drwtNo4': drwtNo4,
      'drwtNo5': drwtNo5,
      'drwtNo6': drwtNo6,
      'bnusNo': bnusNo,
  };
}
