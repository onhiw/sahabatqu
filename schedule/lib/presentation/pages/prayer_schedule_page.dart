import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
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
  String? cityId;
  final searchCity = TextEditingController();

  void _setCurrentAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('currentAddress') != null) {
      setState(() {
        _currentAddress = prefs.getString('currentAddress');
      });
    }
  }

  @override
  void initState() {
    _setCurrentAddress();
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
        cityId = prefs.getString('cityId');
      });
      Future.microtask(() {
        context.read<CityBloc>().add(FetchAllCity());
        context.read<PrayerDailyBloc>().add(GetPrayerDaily(
            prefs.getString('cityId') == null ? "" : prefs.getString('cityId')!,
            DateFormat('yyyy/MM/dd').format(DateTime.now())));
      });
    }
  }

  void _showChooseCity() {
    final citybloc = context.read<CityBloc>();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return WillPopScope(
            onWillPop: () async {
              setState(() {
                searchCity.text = '';
              });
              return true;
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: BlocProvider<CityBloc>.value(
                value: citybloc,
                child:
                    BlocBuilder<CityBloc, CityState>(builder: (context, state) {
                  if (state is CityLoading) {
                    return const Center(child: LoadingIndicator());
                  } else if (state is CityLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: const Text("Pilih Kota",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: searchCity,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            onChanged: (value) {
                              setState(() {});
                            },
                            onTap: () {},
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: true,
                              fillColor: textEditingGrey,
                              hintText: 'Cari Kota...',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...state.city
                                  .where((element) => element.lokasi
                                      .toLowerCase()
                                      .contains(searchCity.text))
                                  .map((kota) => Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              setState(() {
                                                prefs.setString(
                                                    'cityId', kota.id);
                                                searchCity.text = '';
                                                prefs.setString(
                                                    'currentAddress',
                                                    kota.lokasi);
                                              });
                                              _getPrayerSchedule();
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 16,
                                                  right: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  cityId == kota.id
                                                      ? Text(
                                                          kota.lokasi,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          kota.lokasi,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                  cityId == kota.id
                                                      ? const Icon(
                                                          Icons.check_circle,
                                                          color: Colors.green,
                                                        )
                                                      : const Icon(
                                                          Icons.lens_outlined,
                                                          color: Colors.black,
                                                        )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ))
                                  .toList()
                            ],
                          ),
                        )),
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
    DateTime now = DateTime.now();
    var today = HijriCalendar.now();
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
        title: GestureDetector(
          onTap: () {
            _showChooseCity();
          },
          child: Row(
            children: [
              Text(
                _currentAddress == null ? "Pilih Kota" : _currentAddress!,
                maxLines: 1,
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, calendarRoute);
              },
              child: const Icon(
                Icons.event,
                color: themeColor,
              ),
            ),
          )
        ],
      ),
      body: cityId == null
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
                return const Center(child: LoadingIndicator());
              } else if (state is PrayerDailyLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MyHelper.formatDate(now),
                                  style: TextStyle(
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.white
                                          : textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${today.toFormat("dd MMMM yyyy")} H",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child:
                              _buildList(context, state.prayerDailyResponseE)),
                    ],
                  ),
                );
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
