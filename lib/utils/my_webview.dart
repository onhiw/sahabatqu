import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebview extends StatefulWidget {
  MyWebview({
    Key? key,
    this.url,
    this.title,
  }) : super(key: key);

  final String? url;
  final String? title;

  _MyWebviewState createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  bool isLoading = true;
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: new AppBar(
        elevation: 2,
        iconTheme: IconThemeData(
          color: theme.brightness == Brightness.dark ? Colors.white : textColor,
        ),
        backgroundColor:
            theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.title!,
          style: TextStyle(
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: isLoading
                ? Align(
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(
                      backgroundColor: themeColor.withOpacity(0.5),
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ))
                : Container(),
            preferredSize: Size.fromHeight(0.0)),
      ),
      body: InAppWebView(
        key: webViewKey,
        initialOptions: options,
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url!)),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            setState(() {
              isLoading = false;
            });
          }
        },
      ),
    );
  }
}
