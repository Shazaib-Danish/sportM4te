import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://app.sportm4te.com/password/reset',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
