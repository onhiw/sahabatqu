import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          // iconTheme: IconThemeData(
          //   color: ColorPalette.textColor,
          // ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Kegiatan",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
