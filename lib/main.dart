import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jtblotto/rootpage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  Admob.initialize("com.jtb.jtbMusicPlayer");
  runApp(
    new MaterialApp(
      home: MyApp(),
    ) 
  );
}

class MyApp extends StatefulWidget{
  @override
  _LottoAppState createState() => new _LottoAppState();
}

class _LottoAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Lotto',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      
      
    );
  
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
 return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('/ J T B /',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white,
      ),),
      
      backgroundColor: Colors.grey[600],
      styleTextUnderTheLoader: new TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white,
      //loadingText: Text('Now Loading'),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    permission();
    return MaterialApp(
        home : RootPage(),
    );
    
  }
  void permission() async {

    // Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.microphone]);
    // print('per1 : $permissions');
    
    
  }

}
