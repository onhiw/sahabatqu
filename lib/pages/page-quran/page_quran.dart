import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahabatqu/bloc/quran/quran_bloc.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/pages/page-quran/page_detail_quran.dart';
import 'package:sahabatqu/widgets/loading_indicator.dart';

import '../../constants/themes-color.dart';

class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  QuranBloc quranBloc = QuranBloc();

  @override
  void initState() {
    super.initState();
    quranBloc.add(GetQuranList());
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
      backgroundColor: theme.brightness == Brightness.dark
          ? ColorPalette.bgDarkColor
          : Colors.grey[100],
      appBar: AppBar(
          // iconTheme: IconThemeData(color: Colors.white),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Al-Quran",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: _buildQuranList(),
    );
  }

  Widget _buildQuranList() {
    return BlocProvider(
      create: (context) => quranBloc,
      child: BlocListener<QuranBloc, QuranState>(
        listener: (context, state) {
          if (state is QuranLoadError) {
            return showFloatingFlushbar(state.message);
          }
        },
        child: BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            if (state is QuranInitial) {
              return LoadingIndicator();
            } else if (state is QuranLoading) {
              return LoadingIndicator();
            } else if (state is QuranLoaded) {
              return _buildList(context, state.quranModel);
            } else if (state is QuranLoadError) {
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

  Widget _buildList(BuildContext context, QuranModel quranModel) {
    final ThemeData theme = Theme.of(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: quranModel.hasil.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailQuranPage(
                  idNumber: quranModel.hasil[index].nomor,
                  name: quranModel.hasil[index].nama,
                  type: quranModel.hasil[index].type);
            }));
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        (index + 1).toString() + ".",
                        style: TextStyle(
                            fontSize: 16,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : ColorPalette.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quranModel.hasil[index].nama,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorPalette.themeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              quranModel.hasil[index].arti +
                                  " (" +
                                  quranModel.hasil[index].ayat +
                                  ")",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    quranModel.hasil[index].asma,
                    style: TextStyle(
                        fontSize: 20,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : ColorPalette.textColor,
                        fontWeight: FontWeight.bold),
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
}
