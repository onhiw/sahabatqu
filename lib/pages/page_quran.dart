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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorPalette.themeColor,
          elevation: 0,
          title: Text(
            "Al-Quran",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
