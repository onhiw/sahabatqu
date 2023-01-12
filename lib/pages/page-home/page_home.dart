import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:sahabatqu/widgets/widget_event.dart';
import 'package:sahabatqu/widgets/widget_program.dart';
import 'package:schedule/presentation/bloc/city-bloc/city_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-daily-bloc/prayer_daily_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                                prefs.setString(
                                                    'currentAddress',
                                                    "${kota.lokasi}");
                                                searchCity.text = '';
                                              });
                                              _setCurrentAddress();
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

  Widget _buildListSchedule() {
    return BlocBuilder<PrayerDailyBloc, PrayerDailyState>(
        builder: (context, state) {
      if (state is PrayerDailyLoading) {
        return Center(child: loadingSholat());
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
    });
  }

  Widget _buildList(
      BuildContext context, PrayerDailyResponseE prayerDailyResponseE) {
    final ThemeData theme = Theme.of(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // bool isValid;
    var newDate = DateTime.parse("$formattedDate" +
        " " +
        prayerDailyResponseE.prayerDaily!.schedule.subuh);
    var newDate1 = DateTime.parse("$formattedDate" +
        " " +
        prayerDailyResponseE.prayerDaily!.schedule.dzuhur);
    var newDate2 = DateTime.parse("$formattedDate" +
        " " +
        prayerDailyResponseE.prayerDaily!.schedule.ashar);
    var newDate3 = DateTime.parse("$formattedDate" +
        " " +
        prayerDailyResponseE.prayerDaily!.schedule.maghrib);
    var newDate4 = DateTime.parse("$formattedDate" +
        " " +
        prayerDailyResponseE.prayerDaily!.schedule.isya);
    var dateT = now.difference(newDate).inSeconds;
    var dateT1 = now.difference(newDate1).inSeconds;
    var dateT2 = now.difference(newDate2).inSeconds;
    var dateT3 = now.difference(newDate3).inSeconds;
    var dateT4 = now.difference(newDate4).inSeconds;

    if (dateT <= 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subuh",
              style: TextStyle(
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.subuh,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                  child: GestureDetector(
                    onTap: () {
                      _showChooseCity();
                    },
                    child: Text(
                      _currentAddress == null ? "Pilih Kota" : _currentAddress!,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
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
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.dzuhur,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                        : _currentAddress!,
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
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.ashar,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                        : _currentAddress!,
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
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.maghrib,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                        : _currentAddress!,
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
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.isya,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                        : _currentAddress!,
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
                  color: themeColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              prayerDailyResponseE.prayerDaily!.schedule.isya,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : textColor,
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
                        : _currentAddress!,
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
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
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
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
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
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
          elevation: 0,
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyHelper.formatDate(now),
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                today.toFormat("dd MMMM yyyy") + " H",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
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
                  cityId == null
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
                                      fontSize: 12,
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
                      : _buildListSchedule(),
                  Image.asset(
                    "assets/mosque2.png",
                    width: 120,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.pushNamed(context, doaRoute);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/ic_doa.png",
                                        color: themeColor,
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
                                        : textColor,
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
                                Navigator.pushNamed(context, asmaRoute);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/ic_allah.png",
                                        color: themeColor,
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
                                        : textColor,
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
                                Navigator.pushNamed(context, qiblaRoute);
                              },
                              child: Container(
                                // padding: EdgeInsets.all(18),
                                height: 40,
                                width: 40,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.explore_outlined,
                                          size: 40, color: themeColor),
                                      // Image.asset("assets/ic_qiblah.png",
                                      //     color: themeColor),
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
                                        : textColor,
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
                                Navigator.pushNamed(context, galleryRoute);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.image_outlined,
                                          size: 40, color: themeColor),
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
                                        : textColor,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ExpandChild(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  Navigator.pushNamed(context, halalRoute);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Icon(Icons.self_improvement_outlined,
                                        //     size: 40, color: themeColor),
                                        Image.asset(
                                          "assets/ic_halal.png",
                                          color: themeColor,
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text("Halal",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.white
                                          : textColor,
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
                                  Navigator.pushNamed(context, mosqueRoute);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/ic_masjid.png",
                                          color: themeColor,
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text("Masjid",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.white
                                          : textColor,
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
                                  Navigator.pushNamed(context, makkahRoute);
                                },
                                child: Container(
                                  // padding: EdgeInsets.all(18),
                                  height: 40,
                                  width: 40,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/ic_kaaba.png",
                                          color: themeColor,
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text("Mekah",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.white
                                          : textColor,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              // InkWell(
                              //   borderRadius: BorderRadius.circular(40),
                              //   onTap: () {
                              //     Navigator.push(context,
                              //         MaterialPageRoute(builder: (context) {
                              //       return GalleryPage();
                              //     }));
                              //   },
                              //   child: Container(
                              //     height: 40,
                              //     width: 40,
                              //     child: Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: <Widget>[
                              //           Icon(Icons.image_outlined,
                              //               size: 40,
                              //               color: themeColor),
                              //         ]),
                              //   ),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 5),
                              //   child: Text("Gallery",
                              //       style: TextStyle(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.bold,
                              //         color: theme.brightness == Brightness.dark
                              //             ? Colors.white
                              //             : textColor,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
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
