import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:sahabatqu/utils/helper.dart';

import '../constants/themes-color.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  var selectedDate = new HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    DateTime now = DateTime.now();
    var today = new HijriCalendar.now();
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                today.toFormat("dd MMMM yyyy") + " H",
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : ColorPalette.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                MyHelper.formatDate(now),
                style: TextStyle(
                    color: Colors.grey[600],
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          )),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            // color: Colors.white,
            child: Center(
              child: HijriMonthPicker(
                lastDate: new HijriCalendar()
                  ..hYear = 1500
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: new HijriCalendar()
                  ..hYear = 1438
                  ..hMonth = 12
                  ..hDay = 25,
                onChanged: (HijriCalendar value) {
                  setState(() {
                    selectedDate = selectedDate;
                  });
                },
                selectedDate: selectedDate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
