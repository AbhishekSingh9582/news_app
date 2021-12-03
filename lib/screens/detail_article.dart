import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArticle extends StatefulWidget {
  final String url;
  const DetailArticle(this.url, {Key? key}) : super(key: key);

  @override
  State<DetailArticle> createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final _key = UniqueKey();

  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('NewsHunt'),
        centerTitle: true,
      ),
      body: _isError
          ? const AlertDialog(
              contentPadding: EdgeInsets.fromLTRB(24, 30, 24, 30),
              content:
                  Text("Oops.. Looks like there's no\n    internet connection"),
            )
          : Center(
              child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
                onWebResourceError: (error) {
                  setState(() {
                    _isError = true;
                  });
                },
                onWebViewCreated: (WebViewController webViewController) async {
                  _controller.complete(webViewController);

                  // await _controller.runJavascript(
                  //    "document.getElementsByTagName('header')[0].style.display='none'");
                },
              ),
            ),
    );
  }
}
