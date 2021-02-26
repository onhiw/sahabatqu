import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:sahabatqu/pages/page-home/widgets/widget_banner.dart';
import 'package:sahabatqu/pages/page-qiblah/page_qiblah.dart';
import 'package:sahabatqu/pages/page_about.dart';
import 'package:sahabatqu/pages/page_doa.dart';
import 'package:sahabatqu/pages/page_names_allah.dart';
import 'package:sahabatqu/utils/helper.dart';

import '../../constants/themes-color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Geolocator geolocator = Geolocator();
  Position _currentPosition;
  double _lat = 0;
  double _long = 0;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
        .then((value) {
      setState(() {
        _currentPosition = value;
        if (_currentPosition != null) {
          _lat = _currentPosition.latitude;
          _long = _currentPosition.longitude;
          print(_lat);
          print(_long);
        }
      });
      _getAddressFromLatLng();
    });
  }

  _getAddressFromLatLng() async {
    List<Placemark> p = await placemarkFromCoordinates(_lat, _long);
    Placemark place = p[0];

    setState(() {
      _currentAddress = "${place.locality}";
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var today = new HijriCalendar.now();
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyHelper.formatDate(now),
                style: TextStyle(
                    color: ColorPalette.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                today.toFormat("dd MMMM yyyy") + " H",
                style: TextStyle(
                    color: Colors.grey[600],
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          // BannerWidget(),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dzuhur",
                          style: TextStyle(
                              color: ColorPalette.themeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "12:20",
                          style: TextStyle(
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey[600],
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                _currentAddress == null
                                    ? "Sedang mencari lokasi..."
                                    : _currentAddress,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/mosque2.png",
                    width: 120,
                    // color: ColorPalette.themeColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DoaPage();
                            }));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.self_improvement_outlined,
                                      size: 40, color: ColorPalette.themeColor),
                                  // Image.asset(
                                  //   "assets/ic_doa.png",
                                  //   color: ColorPalette.themeColor,
                                  // ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("Doa-Doa",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.textColor)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NamesAllahPage();
                            }));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/ic_allah.png",
                                    color: ColorPalette.themeColor,
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("99 Nama",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.textColor)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QiblahPage();
                            }));
                          },
                          child: Container(
                            // padding: EdgeInsets.all(18),
                            height: 40,
                            width: 40,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.explore_outlined,
                                      size: 40, color: ColorPalette.themeColor),
                                  // Image.asset("assets/ic_qiblah.png",
                                  //     color: ColorPalette.themeColor),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("Kiblat",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.textColor)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AboutPage();
                            }));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.info_outline,
                                      size: 40, color: ColorPalette.themeColor),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("Tentang",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.textColor)),
                        )
                      ],
                    ),
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
