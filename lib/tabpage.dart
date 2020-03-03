import 'package:flutter/material.dart';
import 'package:jtblotto/caluratenumber.dart';
import 'package:jtblotto/data/tabstates.dart';
import 'package:jtblotto/homepage.dart';
import 'package:jtblotto/lottoinfopage.dart';
import 'package:jtblotto/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:jtblotto/tabpage.dart';
import 'package:qrscan/qrscan.dart';
import 'package:url_launcher/url_launcher.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [HomePage(), SearchPage(), LottoInfoPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabStates>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('JTB Lotto'),
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          label: Text('당첨 번호 확인'),
          onPressed: () { _scan(); },
          backgroundColor: Colors.indigo,
        ),
        body:_tabs[Provider.of<TabStates>(context).selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.indigo,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: value.selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.adb), title: Text('AI 번호 추천')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('통계')),
            ]),
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      Provider.of<TabStates>(context).selectedIndex = value;
    });
  }

    Future _scan() async {
    String barcode = await scan();
    launchURL(barcode);
    setState(() {});
    
  }

   Future launchURL(String barcode) async {
     await launch(barcode);
   }

}
