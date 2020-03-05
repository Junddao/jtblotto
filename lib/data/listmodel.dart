
import 'package:flutter/material.dart';

class ListModel<E>{
  final List<E> _items;

  ListModel({@required Iterable<E> initialItems})
  : assert( initialItems != null),
   _items = List<E>.from(initialItems ?? <E>[]);

  void insert(int index, E item){
    _items.insert(index, item);
  }

  E removeAt(int index){
    final removeItem = _items.removeAt(index);
    return removeItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}


class ListItem{
  int totSellamnt;
  int drwNo;
  String returnValue;
  String drwNoDate;
  int firstWinamnt;
  int firstPrzwnerCo;
  int firstAccumamnt;
  int drwtNo1;
  int drwtNo2;
  int drwtNo3;
  int drwtNo4;
  int drwtNo5;
  int drwtNo6;
  int bnusNo;


  ListItem(this.totSellamnt, this.drwNo, this.returnValue, this.drwNoDate, this.firstWinamnt, this.firstPrzwnerCo, this.firstAccumamnt, this.drwtNo1, this.drwtNo2, this.drwtNo3, this.drwtNo4, this.drwtNo5, this.drwtNo6, this.bnusNo);

  ListItem.fromMap(Map<String, dynamic> map) {
    totSellamnt = map["totSellamnt"];
    drwNo = map["drwNo"];
    returnValue = map["returnValue"];
    drwNoDate = map["drwNoDate"];
    firstWinamnt = map["firstWinamnt"];
    firstPrzwnerCo = map["firstPrzwnerCo"];
    firstAccumamnt = map["firstAccumamnt"];
    drwtNo1 = map["drwtNo1"];
    drwtNo2 = map["drwtNo2"];
    drwtNo3 = map["drwtNo3"];
    drwtNo4 = map["drwtNo4"];
    drwtNo5 = map["drwtNo5"];
    drwtNo6 = map["drwtNo6"];
    bnusNo = map["bnusNo"];
    
    
  } 
  
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