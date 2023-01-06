import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/widgets/flushbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:schedule/presentation/bloc/city-bloc/city_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-daily-bloc/prayer_daily_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerSchedulePage extends StatefulWidget {
  const PrayerSchedulePage({super.key});

  @override
  State<PrayerSchedulePage> createState() => _PrayerSchedulePageState();
}

class _PrayerSchedulePageState extends State<PrayerSchedulePage> {
  String? _currentAddress;
  String? cityName;

  LocationPermission? permission;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.delayed(const Duration(seconds: 0)).then((value) {
        flushbarMessage("Layanan lokasi dinonaktifkan.", Colors.red)
            .show(context);
      });
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.delayed(const Duration(seconds: 0)).then((value) {
          flushbarMessage("Izin lokasi ditolak", Colors.red).show(context);
        });
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Future.delayed(const Duration(seconds: 0)).then((value) {
        flushbarMessage(
                "Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin",
                Colors.red)
            .show(context);
      });
    }
    return await Geolocator.getCurrentPosition();
  }

  _getCurrentLocation() async {
    _determinePosition().then((value) {
      _getAddressFromLatLng(value.latitude, value.longitude);
    });
  }

  _getAddressFromLatLng(double lat, double long) async {
    List<Placemark> p = await placemarkFromCoordinates(lat, long);
    Placemark place = p[0];

    setState(() {
      _currentAddress = "${place.locality}";
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    _getPrayerSchedule();
    super.initState();
  }

  void _getPrayerSchedule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('cityId') == null) {
      Future.microtask(() {
        context.read<CityBloc>().add(FetchAllCity());
      });

      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        _showChooseCity();
      });
    } else {
      setState(() {
        cityName = prefs.getString('cityId');
      });
      Future.microtask(() {
        context.read<PrayerDailyBloc>().add(GetPrayerDaily(
            prefs.getString('cityId') == null ? "" : prefs.getString('cityId')!,
            DateFormat('yyyy/MM/dd').format(DateTime.now())));
      });
    }
  }

  void _showChooseCity() {
    final citybloc = context.read<CityBloc>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (cn) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: BlocProvider<CityBloc>.value(
              value: citybloc,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<CityBloc, CityState>(builder: (context, state) {
                    if (state is CityLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CityLoaded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 60,
                            padding: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: textEditingGrey),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: const Text(
                                    'Pilih Lokasi Anda',
                                    style: TextStyle(
                                        color: textColor, fontSize: 14),
                                  ),
                                  isExpanded: true,
                                  underline: Container(),
                                  value: cityName,
                                  items: state.city
                                      .map((value) => DropdownMenuItem(
                                          value: value.id,
                                          child: Text(value.lokasi,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14))))
                                      .toList(),
                                  onChanged: (_) {
                                    setState(() {
                                      cityName = _;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                prefs.setString('cityId', cityName!);
                              });
                              _getPrayerSchedule();
                              Navigator.pop(cn);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: themeColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'Pilih Lokasi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (state is CityError) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(state.message),
                      ));
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _currentAddress == null
              ? "Sedang mencari lokasi..."
              : _currentAddress!,
          style: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return CalenderPage();
                // }));
              },
              child: const Icon(
                Icons.event,
                color: themeColor,
              ),
            ),
          )
        ],
      ),
      body: cityName == null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Anda belum memilih lokasi,\nsilahkan pilih lokasi Anda.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        _showChooseCity();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 8),
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Pilih Lokasi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : BlocBuilder<PrayerDailyBloc, PrayerDailyState>(
              builder: (context, state) {
              if (state is PrayerDailyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PrayerDailyLoaded) {
                return _buildList(context, state.prayerDailyResponseE);
              } else if (state is PrayerDailyError) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(state.message),
                ));
              } else {
                return Container();
              }
            }),
    );
  }

  Widget _buildList(
      BuildContext context, PrayerDailyResponseE prayerDailyResponseE) {
    final ThemeData theme = Theme.of(context);
    return prayerDailyResponseE.prayerDaily == null
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Anda belum memilih lokasi,\nsilahkan pilih lokasi Anda.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      _showChooseCity();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 8, top: 8),
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Pilih Lokasi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.imsak,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.subuh,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.terbit,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.dzuhur,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.ashar,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.maghrib,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prayerDailyResponseE.prayerDaily!.schedule.isya,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
  }
}
