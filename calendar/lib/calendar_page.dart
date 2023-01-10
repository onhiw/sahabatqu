import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  var selectedDate = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    DateTime now = DateTime.now();
    var today = HijriCalendar.now();
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
          ),
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${today.toFormat("dd MMMM yyyy")} H",
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : textColor,
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
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            width: double.infinity,
            child: Center(
              child: HijriMonthPicker(
                lastDate: HijriCalendar()
                  ..hYear = 1500
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: HijriCalendar()
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
