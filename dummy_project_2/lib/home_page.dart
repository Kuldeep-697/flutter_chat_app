import 'package:dummy_project_2/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _webviewUrl = 'http://15.206.222.91/brand-customer-care';

  bool _showWebView = false;
  bool loadingWebView = true;

  void launchURL() async {
    if (await canLaunch(_webviewUrl)) {
      setState(() {
        _showWebView = true;
        loadingWebView = false;
      });
    } else {
      loadingWebView = true;
      throw 'Could not launch $_webviewUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _showWebView
            ? null
            : AppBar(
                leading: _showWebView
                    ? IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _showWebView = false;
                          });
                        },
                      )
                    : null,
                title: const Text(
                  'Bijli',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                backgroundColor: const Color(0xFF0C8CE9),
              ),
        body: _showWebView
            ? loadingWebView
                ? const Center(child: CircularProgressIndicator())
                : WebView(
                    initialUrl: _webviewUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith('http')) {
                        return NavigationDecision.navigate;
                      } else {
                        launch(request.url);
                        return NavigationDecision.prevent;
                      }
                    },
                  )
            : LoginPage(launchURL: launchURL),
      ),
    );
  }
}
