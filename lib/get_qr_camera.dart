import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:url_launcher/url_launcher.dart';

class GetQRCamera extends StatefulWidget {
  @override
  _GetQRCameraState createState() => _GetQRCameraState();
}

class _GetQRCameraState extends State<GetQRCamera> {
  @override
  void initState() {
    super.initState();
    _scan();
  }

  Future _scan() async {
    String barcode = await scan();
    launchURL(barcode);
    setState(() {});
    
  }

  

  
   Future launchURL(String barcode) async {
     await launch(barcode);
   }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}