import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class NamesAllahPage extends StatefulWidget {
  @override
  _NamesAllahPageState createState() => _NamesAllahPageState();
}

class _NamesAllahPageState extends State<NamesAllahPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "99 Nama",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
