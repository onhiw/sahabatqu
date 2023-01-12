import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    DateTime now = DateTime.now();
    var today = HijriCalendar.now();
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
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
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          )),
      body: Column(
        children: [
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SfHijriDateRangePicker(
                    view: HijriDatePickerView.month,
                    selectionColor: themeColor,
                    todayHighlightColor: themeColor,
                    showNavigationArrow: true,
                    selectionTextStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    headerHeight: 55,
                    headerStyle: DateRangePickerHeaderStyle(
                        textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: theme.brightness == Brightness.dark
                          ? Colors.white
                          : textColor,
                    )),
                    monthCellStyle: HijriDatePickerMonthCellStyle(
                        textStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                        ),
                        weekendTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                        todayTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : textColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
