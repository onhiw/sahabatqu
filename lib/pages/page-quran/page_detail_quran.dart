import 'package:flutter/material.dart';
import 'package:sahabatqu/models/quran_id_indonesian_model.dart';
import 'package:sahabatqu/models/quran_uthmani_model.dart';
import 'package:sahabatqu/viewmodel/quran_vm.dart';
import 'package:sahabatqu/widgets/loading_indicator.dart';

import '../../constants/themes-color.dart';

class DetailQuranPage extends StatefulWidget {
  final String? idNumber;
  final String? name;
  final String? type;

  DetailQuranPage({
    Key? key,
    @required this.idNumber,
    @required this.name,
    @required this.type,
  }) : super(key: key);
  @override
  _DetailQuranPageState createState() => _DetailQuranPageState();
}

class _DetailQuranPageState extends State<DetailQuranPage> {
  QuranUthmaniModel? quranUthmaniModel;
  QuranIndonesianModel? quranUthmaniModelID;
  bool isLoading = true;
  bool isLoadingIndonesian = true;

  getRequestUthmani() async {
    QuranViewModel quranVM = QuranViewModel();
    await quranVM.getDataQuranUthmani(widget.idNumber!).then((value) {
      setState(() {
        quranUthmaniModel = value;
        isLoading = false;
      });
    });
  }

  getRequestIndonesiaon() async {
    QuranViewModel quranVM = QuranViewModel();
    await quranVM.getDataQuranIndonesian(widget.idNumber!).then((value) {
      setState(() {
        quranUthmaniModelID = value;
        isLoadingIndonesian = false;
      });
    });
  }

  @override
  void initState() {
    getRequestUthmani();
    getRequestIndonesiaon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name!,
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : ColorPalette.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                widget.type!.toUpperCase(),
                style: TextStyle(
                    color: Colors.grey[600],
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          )),
      body: isLoading
          ? LoadingIndicator()
          : isLoadingIndonesian
              ? LoadingIndicator()
              : ListView(
                  padding: EdgeInsets.all(16),
                  physics: BouncingScrollPhysics(),
                  children: [
                    widget.idNumber == "1"
                        ? Container()
                        : Center(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Text(
                                "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ),
                          ),
                    widget.idNumber == "1"
                        ? Container()
                        : SizedBox(
                            height: 16,
                          ),
                    ...quranUthmaniModel!.data!.ayahs!
                        .asMap()
                        .map((i, value) => MapEntry(
                            i,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.idNumber == "1"
                                      ? value.text!
                                      : value.text!.replaceAll(
                                          "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                          ""),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      // color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (i + 1).toString() + ".",
                                        style: TextStyle(
                                            color: theme.brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : ColorPalette.textColor,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Text(
                                          quranUthmaniModelID!
                                              .data!.ayahs![i].text!,
                                          style: TextStyle(
                                              color: theme.brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : ColorPalette.textColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            )))
                        .values
                        .toList()
                  ],
                ),
    );
  }

  Widget getDataQuran() {
    QuranViewModel quranVM = QuranViewModel();
    return FutureBuilder<QuranUthmaniModel>(
      future: quranVM.getDataQuranUthmani(widget.idNumber!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final QuranUthmaniModel quranUthmaniModel = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: quranUthmaniModel.data!.ayahs!.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quranUthmaniModel.data!.ayahs![index].text!,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  FutureBuilder<QuranIndonesianModel>(
                    future: quranVM.getDataQuranIndonesian(widget.idNumber!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final QuranIndonesianModel quranUthmaniModelID =
                            snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: quranUthmaniModel.data!.ayahs!.length,
                          itemBuilder: (context, i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quranUthmaniModelID.data!.ayahs![i].text!,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  )
                ],
              );
            },
          );
        }
        return LoadingIndicator();
      },
    );
  }
}
