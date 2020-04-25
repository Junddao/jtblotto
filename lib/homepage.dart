
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  WebViewController _webViewController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String url = "";
  double progress = 0;


  String lottoUrl = 'https://m.dhlottery.co.kr/common.do?method=main';
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var future = _webViewController.canGoBack();
        future.then((canGoBack) {
          if (canGoBack) {
            _webViewController.goBack();
          } 
        });
        return Future.value(false);
      },
      child : Scaffold(
        body: SafeArea(
          child : WebView(
            initialUrl: lottoUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
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