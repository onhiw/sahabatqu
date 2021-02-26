import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: ColorPalette.textColor,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Tentang",
            style: TextStyle(
                color: ColorPalette.textColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
