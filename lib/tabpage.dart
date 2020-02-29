import 'package:flutter/material.dart';
import 'package:jtblotto/caluratenumber.dart';
import 'package:jtblotto/data/tabstates.dart';
import 'package:jtblotto/lottoinfopage.dart';
import 'package:jtblotto/searchpage.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [CalurateNumber(), SearchPage(), LottoInfoPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabStates>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('JTB Lotto'),
          automaticallyImplyLeading: false,
        ),
        body: _tabs[Provider.of<TabStates>(context).selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('번호생성')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('QR 당첨확인')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('당첨판매점 보기')),
            ]),
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
