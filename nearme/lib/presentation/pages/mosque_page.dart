import 'dart:io';

import 'package:core/core.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:core/widgets/flushbar_widget.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearme/presentation/bloc/nearme-bloc/nearme_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MosquePage extends StatefulWidget {
  const MosquePage({super.key});

  @override
  State<MosquePage> createState() => _MosquePageState();
}

class _MosquePageState extends State<MosquePage> {
  String? _currentAddress;

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
      _currentAddress = place.locality;
    });

    Future.microtask(() {
      context.read<NearmeBloc>().add(FetchNearme('$lat,$long', 'mosque'));
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
          iconTheme: IconThemeData(
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
          ),
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          elevation: 0,
          title: Text(
            _currentAddress == null
                ? "Sedang mencari lokasi..."
                : _currentAddress!,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: BlocBuilder<NearmeBloc, NearmeState>(builder: (context, state) {
        if (state is NearmeLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is NearmeLoaded) {
          return _buildList(context, state.nearmeList);
        } else if (state is NearmeEmpty) {
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
                    color: themeColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Oops...\nMasjid tidak ditemukan dilokasi anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          );
        } else if (state is NearmeError) {
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

  Widget _buildList(BuildContext context, List<Nearme> nearme) {
    final ThemeData theme = Theme.of(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: nearme.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            _launchMaps(nearme[i].nearmeGeometry.nearmeLocation.lat.toString(),
                nearme[i].nearmeGeometry.nearmeLocation.lng.toString());
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  "assets/ic_mosque.png",
                  width: 24,
                  height: 24,
                  color: themeColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nearme[i].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : textColor),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        nearme[i].vicinity,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
        return const Divider(
          thickness: 1,
        );
      },
    );
  }

  _launchMaps(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
    if (!await launchUrl(
      Uri.parse(Platform.isIOS ? appleUrl : googleUrl),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch';
    }
  }
}
