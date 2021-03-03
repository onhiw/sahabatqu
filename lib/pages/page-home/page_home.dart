import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/pages/page-qiblah/page_qiblah.dart';
import 'package:sahabatqu/pages/page_doa.dart';
import 'package:sahabatqu/pages/page_gallery.dart';
import 'package:sahabatqu/pages/page_names_allah.dart';
import 'package:sahabatqu/utils/helper.dart';
import 'package:sahabatqu/viewmodel/jadwal_sholat_vm.dart';
import 'package:sahabatqu/widgets/widget_event.dart';
import 'package:sahabatqu/widgets/widget_program.dart';
import 'package:shimmer/shimmer.dart';

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

  JadwalSholatModel jadwalSholatModel;
  bool isLoading = true;

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
        }
      });
      _getAddressFromLatLng();
      _getJadwaSholat();
    });
  }

  _getAddressFromLatLng() async {
    List<Placemark> p = await placemarkFromCoordinates(_lat, _long);
    Placemark place = p[0];

    setState(() {
      _currentAddress = "${place.locality}";
    });
  }

  Future _getJadwaSholat() async {
    try {
      JadwalSholatViewModel jadwalSholatVM = JadwalSholatViewModel();
      await jadwalSholatVM
          .getJadwalSholat(_lat.toString(), _long.toString())
          .then((value) {
        setState(() {
          jadwalSholatModel = value;
          isLoading = false;
        });
      });
    } on DioError catch (err) {
      if (err.type == DioErrorType.CONNECT_TIMEOUT) {
        return showFloatingFlushbar('Connection Timeout Exception');
      } else if (err.type == DioErrorType.RESPONSE) {
        return showFloatingFlushbar('Terjadi kesalahan saat permintaan');
      }
    }
  }

  void showFloatingFlushbar(String msg) {
    Flushbar(
      // aroundPadding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10.0),
      borderRadius: 8,
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

  Widget getDataJadwalSholat() {
    final ThemeData theme = Theme.of(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // bool isValid;
    var newDate = DateTime.parse("$formattedDate" +
        " " +
        jadwalSholatModel.results.datetime[0].times.fajr);
    var newDate1 = DateTime.parse("$formattedDate" +
        " " +
        jadwalSholatModel.results.datetime[0].times.dhuhr);
    var newDate2 = DateTime.parse("$formattedDate" +
        " " +
        jadwalSholatModel.results.datetime[0].times.asr);
    var newDate3 = DateTime.parse("$formattedDate" +
        " " +
        jadwalSholatModel.results.datetime[0].times.maghrib);
    var newDate4 = DateTime.parse("$formattedDate" +
        " " +
        jadwalSholatModel.results.datetime[0].times.isha);
    var dateT = now.difference(newDate).inSeconds;
    var dateT1 = now.difference(newDate1).inSeconds;
    var dateT2 = now.difference(newDate2).inSeconds;
    var dateT3 = now.difference(newDate3).inSeconds;
    var dateT4 = now.difference(newDate4).inSeconds;

    if (jadwalSholatModel == null) {
      return Container();
    }

    if (dateT <= 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subuh",
              style: TextStyle(
                  color: ColorPalette.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              jadwalSholatModel.results.datetime[0].times.fajr,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    } else if (dateT1 <= 0) {
      return Expanded(
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
              jadwalSholatModel.results.datetime[0].times.dhuhr,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    } else if (dateT2 <= 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ashar",
              style: TextStyle(
                  color: ColorPalette.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              jadwalSholatModel.results.datetime[0].times.asr,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    } else if (dateT3 <= 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Magrib",
              style: TextStyle(
                  color: ColorPalette.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              jadwalSholatModel.results.datetime[0].times.maghrib,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    } else if (dateT4 <= 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Isya",
              style: TextStyle(
                  color: ColorPalette.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              jadwalSholatModel.results.datetime[0].times.isha,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    } else {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Isya",
              style: TextStyle(
                  color: ColorPalette.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              jadwalSholatModel.results.datetime[0].times.isha,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      );
    }
  }

  Widget loadingSholat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: 120,
            height: 15,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: 80,
            height: 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var today = new HijriCalendar.now();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: AppBar(
          // iconTheme: IconThemeData(color: Colors.white),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyHelper.formatDate(now),
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : ColorPalette.textColor,
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
                  isLoading ? loadingSholat() : getDataJadwalSholat(),
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
                                  // Icon(Icons.self_improvement_outlined,
                                  //     size: 40, color: ColorPalette.themeColor),
                                  Image.asset(
                                    "assets/ic_doa.png",
                                    color: ColorPalette.themeColor,
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("Doa-Doa",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : ColorPalette.textColor,
                              )),
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
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : ColorPalette.textColor,
                              )),
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
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : ColorPalette.textColor,
                              )),
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
                              return GalleryPage();
                            }));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.image_outlined,
                                      size: 40, color: ColorPalette.themeColor),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("Gallery",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : ColorPalette.textColor,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          EventWidget(),
          SizedBox(
            height: 10,
          ),
          ProgramWidget(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
