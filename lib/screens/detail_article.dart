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
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        title: const Text('NewsHunt'),
        centerTitle: true,
      ),
      body: Stack(children: [
        WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) async {
            _controller.complete(webViewController);

            // await _controller.runJavascript(
            //    "document.getElementsByTagName('header')[0].style.display='none'");
          },
          onPageFinished: (url) => setState(() {
            _isLoading = false;
          }),
        ),
        _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ]),
    );
  }
}
