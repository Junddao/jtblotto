import 'package:flutter/material.dart';

class SixNumbers with ChangeNotifier{
  List<int> _numbers = List<int>.generate(6, (index)=> 0);

  List<int> getNumbers() => _numbers; 
  void setNumbers(List<int> numbers){
    _numbers = numbers;
    notifyListeners();
  }

} 