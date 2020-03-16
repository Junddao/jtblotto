import 'package:flutter/material.dart';
import 'package:jtblotto/calcuratenumber.dart';
import 'package:jtblotto/data/tabstates.dart';
import 'package:jtblotto/get_qr_camera.dart';
import 'package:jtblotto/homepage.dart';
import 'package:jtblotto/lottoinfopage.dart';
import 'package:jtblotto/services/myadshelper.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart';
import 'package:url_launcher/url_launcher.dart';


class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [HomePage(), CalcurateNumber(), GetQRCamera(), LottoInfoPage()];

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Consumer<TabStates>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('JTB Lotto'),
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
        ),
        
        body:  _tabs[Provider.of<TabStates>(context, listen: false).selectedIndex],
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
                  icon: Icon(Icons.camera_alt), title: Text('QR 확인')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('통계')),
            ]),
            
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      Provider.of<TabStates>(context, listen: false).selectedIndex = value;
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
