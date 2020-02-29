import 'package:admob_flutter/admob_flutter.dart';


const String appId  = 'ca-app-pub-9695790043722201~1735664360'; // mine
// const String appId  = 'ca-app-pub-3940256099942544~3347511713'; //test

class Ads {
  showBanner(){
    return AdmobBanner(
      adUnitId: "ca-app-pub-9695790043722201/3765282201",
      adSize: AdmobBannerSize.BANNER,
      listener: (AdmobAdEvent event, Map<String, dynamic> args){
        if(event == AdmobAdEvent.clicked){

        }
      },
    );
  }

}