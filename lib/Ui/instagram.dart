import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class instagram extends StatefulWidget {
  const instagram({Key? key}) : super(key: key);

  @override
  State<instagram> createState() => _instagramState();
}

class _instagramState extends State<instagram> {
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
        initialUrl: 'https://www.instagram.com/'
      ),//https://www.instagram.com/accounts/login/
    );
  }
}