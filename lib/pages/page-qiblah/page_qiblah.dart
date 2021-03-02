import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sahabatqu/widgets/loading_indicator.dart';
import 'package:sahabatqu/pages/page-qiblah/qiblah_compas_widget.dart';
import 'package:sahabatqu/pages/page-qiblah/qiblah_maps.dart';

import '../../constants/themes-color.dart';

class QiblahPage extends StatefulWidget {
  @override
  _QiblahPageState createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          iconTheme: IconThemeData(color: ColorPalette.textColor),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Kiblat",
            style: TextStyle(
                color: ColorPalette.textColor, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}
