import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final widget = (Platform.isAndroid)
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(themeColor),
          )
        : const CupertinoActivityIndicator();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          const SizedBox(
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
