import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class whatsapp extends StatefulWidget {
  const whatsapp ({Key? key}) : super(key: key);

  @override
  State<whatsapp > createState() => _whatsappState();
}

class _whatsappState extends State<whatsapp> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://www.whatsapp.com/'
      ),
    );
  }
}