import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class DoaPage extends StatefulWidget {
  @override
  _DoaPageState createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
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
            "Doa-Doa",
            style: TextStyle(
                color: ColorPalette.textColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
