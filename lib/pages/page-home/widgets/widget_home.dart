import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:sahabatqu/pages/page-qiblah/page_qiblah.dart';
import 'package:sahabatqu/pages/page-quran/page_quran.dart';

import '../../../constants/themes-color.dart';
import '../../page_jadwal_sholat.dart';
import '../page_home.dart';

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
    QiblahPage()
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: new Text('Keluar dari aplikasi Sahabat Az-Zikra?'),
            content:
                new Text('Tekan tombol YA jika ingin keluar dari aplikasi.'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('TIDAK'),
              ),
              new FlatButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('YA'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
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
                          Icon(Icons.home, color: Colors.grey[600]),
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ]),
              _page == 1
                  ? Icon(Icons.access_time, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.access_time, color: Colors.grey[600]),
                          Text(
                            "Sholat",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ]),
              _page == 2
                  ? Icon(Icons.menu_book, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.menu_book, color: Colors.grey[600]),
                          Text(
                            "Al-Quran",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ]),
              _page == 3
                  ? Icon(Icons.public, color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.explore, color: Colors.grey[600]),
                          Text(
                            "Kiblat",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ]),
            ],
            color: Colors.white,
            buttonBackgroundColor: ColorPalette.themeColor,
            backgroundColor: Colors.grey[100],
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
