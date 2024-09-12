import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  double _progressBar = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://www.onedios.com/'),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progressBar = progress / 100;
                });
              },
            ),
            _progressBar < 1 
            ? SizedBox(            
              height: 5,
              child: LinearProgressIndicator(
                value: _progressBar,
              ),
            )
            : const SizedBox()
          ],
        ),
      ),
    );
  }
}
