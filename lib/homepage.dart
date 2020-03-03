import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  InAppWebViewController webView;
  String url = "";
  double progress = 0;


  String lottoUrl = 'https://m.dhlottery.co.kr/common.do?method=main';
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child : Scaffold(
        body: SafeArea(
          
          child : InAppWebView(
            initialUrl: lottoUrl,
            initialHeaders: {},
            initialOptions: InAppWebViewWidgetOptions(
             
              crossPlatform: InAppWebViewOptions(
                
                debuggingEnabled: true,

              ),
              
            ),
         
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              setState(() {
                this.url = url;
              });
            },
            onLoadStop: (InAppWebViewController controller, String url) async {
              setState(() {
                this.url = url;
              });
            },
            onProgressChanged: (InAppWebViewController controller, int progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            
          ),
        ),
      //   child: WebView(
      //     key: Key('webview'),
      //     initialUrl: youtubeUri + query + widget.title,
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onWebViewCreated: (WebViewController webViewController) {
      //       _webViewController = webViewController;
      //     },
      //   ),
      //   bottom: true,
      //   left: true,
      //   right: true,
      //   top: true,
      // ),
      ),
    );
  }
}