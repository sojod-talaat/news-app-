/*class webview extends StatelessWidget {
  const webview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scafold(

    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types, must_be_immutable
class web extends StatelessWidget {
  var url;
  web(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View '),
      ),
      body: Container(
          child: WebView(
        initialUrl: url,
      )),
    );
  }
}
