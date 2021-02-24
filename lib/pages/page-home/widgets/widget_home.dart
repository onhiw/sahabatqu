import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/fab_bottom_bar.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/pages/page-home/page_home.dart';
import 'package:sahabatqu/pages/page_jadwal_sholat.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  bool keyboardOpen = false;
  int _currentIndex = 0;
  final List _children = [HomePage(), JadwalSholatPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: FABBottomBar(
        color: Colors.black,
        selectedColor: ColorPalette.themeColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: onTabTapped,
        items: [
          FABBottomBarItem(iconData: Icons.home, text: 'Beranda'),
          // FABBottomBarItem(iconData: Icons.event, text: 'Kegiatan'),
          FABBottomBarItem(iconData: Icons.access_time, text: 'Sholat'),
          // FABBottomBarItem(iconData: Icons.account_circle, text: 'Profil')
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: keyboardOpen ? SizedBox() : _buildFab(context),
    );
  }

  // Widget _buildFab(BuildContext context) {
  //   return FloatingActionButton(
  //     onPressed: () {
  //     },
  //     tooltip: 'Actions',
  //     child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(50), color: Colors.red),
  //         child: Center(
  //             child: Icon(
  //           Icons.warning,
  //           color: Colors.yellow,
  //         ))),
  //     elevation: 4.0,
  //   );
  // }
}
