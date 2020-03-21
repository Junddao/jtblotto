import 'package:flutter/material.dart';
import 'package:jtblotto/calcuratenumber.dart';
import 'package:jtblotto/data/appbarcontents.dart';
import 'package:jtblotto/data/tabstates.dart';
import 'package:jtblotto/getContactsPage.dart';
import 'package:jtblotto/get_qr_camera.dart';
import 'package:jtblotto/homepage.dart';
import 'package:jtblotto/lottoinfopage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';


class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}



class _TabPageState extends State<TabPage> {
  String _url = 'https://play.google.com/store/apps/details?id=com.jtb.jtblotto';
  final List<Widget> _tabs = [HomePage(), CalcurateNumber(), GetQRCamera(), LottoInfoPage()];
  String friendPhoneNumber;
  
  @override
  void initState() {
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
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return AppBarContants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }
            ),
          ],
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

   Future launchURL(String barcode) async {
     await launch(barcode);
   }



  Future<void> choiceAction(String choice) async{
    await permission('contacts');
    friendPhoneNumber = await Navigator.push(context, MaterialPageRoute(builder: (context) => GetContactPage()));
    await _sendSMS();
  }

  Future<void> _sendSMS() async {
    try {
      await sendSMS(message: _url, recipients: [friendPhoneNumber]);
      setState(() {});
    } catch (error) {
      setState(() {});
    }
  }

   Future<void> permission(String choice) async {

    if(choice == 'camera') await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    else if(choice == 'contacts') await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
  }

}
