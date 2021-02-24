import 'package:flutter/material.dart';

import '../constants/themes-color.dart';

class QiblahPage extends StatefulWidget {
  @override
  _QiblahPageState createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: ColorPalette.themeColor),
          backgroundColor: Colors.white,
          title: Text(
            "Kiblat",
            style: TextStyle(
                color: ColorPalette.themeColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
