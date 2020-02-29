import 'package:flutter/material.dart';



class TabPage extends StatefulWidget {

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _selectedIndex = 0;
  
  List _pages = [
    Text('page1'),
    Text('page2'),
    Text('page3'),
    
  ];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar:  AppBar(
          title:  Text('aaa'),
          automaticallyImplyLeading: false,
          
        ),
      body: Center(child: 
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),),
      
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                items : <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('번호생성')),
                BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('QR 당첨확인')),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('')),
        
              ]
            ),
          );
        }
        
        void _onItemTapped(int value) {
          setState(() {
          _selectedIndex = value; 
          }
        );
  }
}
