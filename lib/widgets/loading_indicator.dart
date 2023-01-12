import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final widget = (Platform.isAndroid)
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(themeColor),
          )
        : CupertinoActivityIndicator();
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          SizedBox(
            height: 8,
          ),
          Text(
            "Mohon Tunggu...",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor),
          )
        ],
      )),
    );
  }
}
