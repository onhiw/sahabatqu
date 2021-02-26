import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/pages/page_calender.dart';
import 'package:sahabatqu/utils/helper.dart';
import 'package:sahabatqu/viewmodel/jadwal_sholat_vm.dart';

import '../constants/themes-color.dart';

class JadwalSholatPage extends StatefulWidget {
  @override
  _JadwalSholatPageState createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
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
        title: Text(
          _currentAddress == null
              ? "Sedang mencari lokasi..."
              : _currentAddress,
          style: TextStyle(
              color: ColorPalette.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CalenderPage();
                }));
              },
              child: Icon(
                Icons.event,
                color: ColorPalette.themeColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyHelper.formatDate(now),
                    style: TextStyle(
                        color: ColorPalette.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    today.toFormat("dd MMMM yyyy") + " H",
                    style: TextStyle(
                        color: Colors.grey[600],
                        // fontWeight: FontWeight.bold,
                        fontSize: 14),
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
            child: getJadwal(),
          )
        ],
      ),
    );
  }

  Widget getJadwal() {
    JadwalSholatViewModel jadwalSholatVM = JadwalSholatViewModel();
    return FutureBuilder(
      future: jadwalSholatVM.getJadwalSholat(_lat.toString(), _long.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final JadwalSholatModel jadwalSholatModel = snapshot.data;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: jadwalSholatModel.results.datetime.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Imsak",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel.results.datetime[index].times.imsak,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subuh (Fajr)",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel.results.datetime[index].times.fajr,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Terbit",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel
                              .results.datetime[index].times.sunrise,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dzuhur",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel.results.datetime[index].times.dhuhr,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ashar",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel.results.datetime[index].times.asr,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Magrib",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel
                              .results.datetime[index].times.maghrib,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Isya",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jadwalSholatModel.results.datetime[index].times.isha,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              );
            },
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 8,
              ),
              Text(
                "Mohon Tunggu...",
                style: TextStyle(color: ColorPalette.textColor),
              )
            ],
          ),
        );
      },
    );
  }
}
