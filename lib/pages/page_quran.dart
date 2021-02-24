import 'package:flutter/material.dart';

import '../constants/themes-color.dart';

class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: ColorPalette.themeColor),
          backgroundColor: Colors.white,
          title: Text(
            "Al-Quran",
            style: TextStyle(
                color: ColorPalette.themeColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
