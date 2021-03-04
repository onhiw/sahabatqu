import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:sahabatqu/constants/constants.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class MyWebview extends StatefulWidget {
  MyWebview(
      {Key key, this.onUrlChanged, this.onStateChanged, this.url, this.title})
      : super(key: key);

  final ValueChanged<String> onUrlChanged;
  final String url;
  final String title;
  final ValueChanged<WebViewStateChanged> onStateChanged;
  final FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();

  _MyWebviewState createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  @override
  void initState() {
    super.initState();

    widget.flutterWebviewPlugin.onUrlChanged.listen((String url) {
      widget.onUrlChanged(url);
    });

    widget.flutterWebviewPlugin.onStateChanged.listen((event) {
      widget.onStateChanged(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.flutterWebviewPlugin.close();
    widget.flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return WebviewScaffold(
        url: widget.url,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        withZoom: true,
        hidden: true,
        primary: true,
        resizeToAvoidBottomInset: true,
        initialChild: Center(child: CircularProgressIndicator()),
        withLocalStorage: true,
        appCacheEnabled: true,
        supportMultipleWindows: true,
        withJavascript: true,
        clearCache: true,
        clearCookies: true,
        userAgent: mobileUA);
  }
}
