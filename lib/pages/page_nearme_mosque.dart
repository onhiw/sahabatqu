import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sahabatqu/bloc/nearme_mosque/nearme_mosque_bloc.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/models/nearme_mosque_model.dart';
import 'package:sahabatqu/widgets/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearmeMosquePage extends StatefulWidget {
  @override
  _NearmeMosquePageState createState() => _NearmeMosquePageState();
}

class _NearmeMosquePageState extends State<NearmeMosquePage> {
  final Geolocator geolocator = Geolocator();
  NearmeMosqueBloc mosqueBloc = NearmeMosqueBloc();
  Position _currentPosition;
  double _lat = 0;
  double _long = 0;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> basket = Provider.of(context, listen: false);
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyyMMdd');
    final String formatted = formatter.format(now);
    _getCurrentLocation();
    print(basket['latitude']);
    print(basket['longitude']);
    mosqueBloc.add(GetNearmeMosqueList(
        basket['latitude'] == null ? _lat.toString() : basket['latitude'],
        basket['longitude'] == null ? _long.toString() : basket['longitude'],
        formatted));
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
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Masjid",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: _buildMosqueList(),
    );
  }

  Widget _buildMosqueList() {
    return BlocProvider(
      create: (context) => mosqueBloc,
      child: BlocListener<NearmeMosqueBloc, NearmeMosqueState>(
        listener: (context, state) {
          if (state is NearmeMosqueError) {
            return showFloatingFlushbar(state.message);
          }
        },
        child: BlocBuilder<NearmeMosqueBloc, NearmeMosqueState>(
          builder: (context, state) {
            if (state is NearmeMosqueInitial) {
              return LoadingIndicator();
            } else if (state is NearmeMosqueLoading) {
              return LoadingIndicator();
            } else if (state is NearmeMosqueLoaded) {
              return _buildList(context, state.mosqueModel);
            } else if (state is NearmeMosqueError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(state.message),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, NearmeMosqueModel nearmeMosqueModel) {
    final ThemeData theme = Theme.of(context);
    if (nearmeMosqueModel.response.groups.length == 0) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ic_mosque.png",
                width: 100,
                height: 100,
                color: ColorPalette.themeColor,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Oops Terjadi kesalahan, Lokasi masjid tidak ditemukan, coba beberapa saat lagi",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );
    } else {
      for (int i = 0; i < nearmeMosqueModel.response.groups.length; i++) {
        if (nearmeMosqueModel.response.groups[i].items.length == 0) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/ic_mosque.png",
                    width: 100,
                    height: 100,
                    color: ColorPalette.themeColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Oops Terjadi kesalahan, Lokasi masjid tidak ditemukan, coba beberapa saat lagi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          );
        }
      }
    }
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: nearmeMosqueModel.response.groups[0].items.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            _launchMaps(
                nearmeMosqueModel.response.groups[0].items[i].venue.location.lat
                    .toString(),
                nearmeMosqueModel.response.groups[0].items[i].venue.location.lng
                    .toString());
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  "assets/ic_mosque.png",
                  width: 24,
                  height: 24,
                  color: ColorPalette.themeColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nearmeMosqueModel
                            .response.groups[0].items[i].venue.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : ColorPalette.textColor),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        nearmeMosqueModel.response.groups[0].items[i].venue
                            .location.formattedAddress[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
        );
      },
    );
  }

  _launchMaps(String lat, String long) async {
    print(lat);
    print(long);
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
    if (await canLaunch(Platform.isIOS ? appleUrl : googleUrl)) {
      await launch(Platform.isIOS ? appleUrl : googleUrl);
    } else {
      throw 'Could not launch url';
    }
  }
}
