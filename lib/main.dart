import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jtblotto/services/myadshelper.dart';

void main() => runApp(LottoApp());


class LottoApp extends StatefulWidget {

  
  @override
  _LottoAppState createState() => _LottoAppState();
}

class _LottoAppState extends State<LottoApp> {

  @override
  void initState() {
    
    super.initState();
    Ads.showBannerAd();  
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Lotto',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // builder:(BuildContext context, Widget child){
        
      //   myBanner
      //     // typically this happens well before the ad is shown
      //     ..load()
      //     ..show(
      //       // Positions the banner ad 60 pixels from the bottom of the screen
      //       anchorOffset: 0.0,
      //       // Positions the banner ad 10 pixels from the center of the screen to the right
      //       //horizontalCenterOffset: 0.0,
      //       // Banner Position
      //       anchorType: AnchorType.bottom,
      //     );
      //   return new Padding(
      //     child: child,
      //     padding: const EdgeInsets.only(
      //       bottom: 50.0,
      //     ),

      //   );
      // }

      
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

  var numbers = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {

    
    // InterstitialAd myInterstitial = InterstitialAd(
    //   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    //   // https://developers.google.com/admob/android/test-ads
    //   // https://developers.google.com/admob/ios/test-ads
    //   adUnitId: InterstitialAd.testAdUnitId,
    //   targetingInfo: targetingInfo,
    //   listener: (MobileAdEvent event) {
    //     print("InterstitialAd event is $event");
    //   },
    // );

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Lotto'),
      ),
      body: Column(children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              Text(numbers[0].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[1].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[2].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[3].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[4].toString(), style: TextStyle(fontSize: 20),),
              Text(numbers[5].toString(), style: TextStyle(fontSize: 20),),
             
          ],),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              
          ],),
        ),
        Expanded(
          flex: 1,
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getNumber();
                setState(() {
                  
                });
              },
            ),
          ),
           Spacer(
          flex: 1,
        ),
      ],),
    );
  }

  getNumber(){
    int position = 0;
    
    while(true)
    {
      bool isDuplicate = false;
      int temp = new Random().nextInt(46);
      for (var i = 0 ; i < 6; i++){
       
        if(numbers[i] == temp){
            isDuplicate = true;
          }
      }
      if(isDuplicate == false && temp != 0)
      {
        numbers[position] = temp;
        position++;
      }
      
      if(position > 5){
        break;
      }
    }
   
    numbers.sort();
  }
}
