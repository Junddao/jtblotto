import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   width: 200,
            //   height: 200,
            //   child: Image.memory(bytes),
            // ),
            RaisedButton(onPressed: _scan, child: Text("Click Here")),
          ],
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scan();
    launchURL(barcode);
    setState(() {});
    
  }

   Future launchURL(String barcode) async {
     await launch(barcode);
   }

  // Future _scanPhoto() async {
  //   String barcode = await scanner.scanPhoto();
  //   setState(() => this.barcode = barcode);
  // }

  // Future _generateBarCode() async {
  //   Uint8List result = await scanner.generateBarCode('https://github.com/leyan95/qrcode_scanner');
  //   this.setState(() => this.bytes = result);
  // }

  
}