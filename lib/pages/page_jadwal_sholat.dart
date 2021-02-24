import 'package:flutter/material.dart';

import '../constants/themes-color.dart';

class JadwalSholatPage extends StatefulWidget {
  @override
  _JadwalSholatPageState createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: ColorPalette.themeColor),
          backgroundColor: Colors.white,
          title: Text(
            "Jadwal Sholat",
            style: TextStyle(
                color: ColorPalette.themeColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
