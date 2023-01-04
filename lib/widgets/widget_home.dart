import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:sahabatqu/pages/page-quran/page_quran.dart';
import 'package:sahabatqu/pages/page_about.dart';

import '../constants/themes-color.dart';
import '../pages/page_jadwal_sholat.dart';
import '../pages/page-home/page_home.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _page = 0;
  // int _index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final List<Widget> _children = [
    HomePage(),
    JadwalSholatPage(),
    QuranPage(),
    AboutPage()
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 3000), (timer) {
      setState(() {
        _checkConnection();
      });
    });
  }

  Future<bool> _onWillPop() async {
    final ThemeData theme = Theme.of(context);
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            contentTextStyle: TextStyle(
              fontFamily: 'Poppins',
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: Constants.padding,
                      top: Constants.avatarRadius + Constants.padding,
                      right: Constants.padding,
                      bottom: Constants.padding),
                  margin: EdgeInsets.only(top: Constants.avatarRadius),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: theme.brightness == Brightness.dark
                        ? ColorPalette.bgDarkColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(Constants.padding),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Keluar Aplikasi ?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Anda akan keluar dari aplikasi",
                        style: TextStyle(
                            fontSize: 14,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: Center(
                                    child: Text(
                                      "Tidak",
                                      style: TextStyle(
                                          color: ColorPalette.themeColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  SystemNavigator.pop();
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorPalette.themeColor),
                                  child: Center(
                                    child: Text(
                                      "Ya",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: Constants.padding,
                  right: Constants.padding,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Constants.avatarRadius,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Constants.avatarRadius)),
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdt12mgKthASs1d-8dTOXZ6Xhoy281I5hkuA&usqp=CAU")),
                  ),
                ),
              ],
            ),
          ),
        )) ??
        false;
  }

  void _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      return showFloatingFlushbar('Tidak ada koneksi internet');
    }
  }

  void showFloatingFlushbar(String msg) {
    Flushbar(
      // aroundPadding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(8),
      backgroundGradient: LinearGradient(
        colors: [Colors.red, Colors.redAccent],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],

      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarPosition: FlushbarPosition.TOP,
      message: msg,
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      duration: Duration(seconds: 2),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () {
        return _onWillPop();
      },
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: <Widget>[
              _page == 0
                  ? Icon(Icons.home, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.home,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.grey[600]),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey[600]),
                          ),
                        ]),
              _page == 1
                  ? Icon(Icons.access_time, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.access_time,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.grey[600]),
                          Text(
                            "Sholat",
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey[600]),
                          ),
                        ]),
              _page == 2
                  ? Icon(Icons.menu_book, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.menu_book,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.grey[600]),
                          Text(
                            "Al-Quran",
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey[600]),
                          ),
                        ]),
              _page == 3
                  ? Icon(Icons.info_outline, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.info_outline,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.grey[600]),
                          Text(
                            "Tentang",
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey[600]),
                          )
                        ]),
            ],
            color: theme.brightness == Brightness.dark
                ? ColorPalette.appBarDarkColor
                : Colors.white,
            buttonBackgroundColor: ColorPalette.themeColor,
            backgroundColor: theme.brightness == Brightness.dark
                ? ColorPalette.bgDarkColor
                : Colors.grey[100]!,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
                // _index = index;
              });
            },
            letIndexChange: (index) => true,
          ),
          body: _children[_page]),
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 35;
  static const double avatarRadius = 40;
}
