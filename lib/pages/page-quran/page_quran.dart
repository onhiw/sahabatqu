import 'package:flutter/material.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/pages/page-quran/page_detail_quran.dart';
import 'package:sahabatqu/viewmodel/quran_vm.dart';

import '../../constants/themes-color.dart';

class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    QuranViewModel quranVM = QuranViewModel();
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Al-Quran",
            style: TextStyle(
                color: ColorPalette.textColor, fontWeight: FontWeight.bold),
          )),
      body: FutureBuilder<QuranModel>(
        future: quranVM.getDataQuran(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final QuranModel quranModel = snapshot.data;
            return ListView.separated(
              itemCount: quranModel.hasil.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                                    color: ColorPalette.textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
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
                            ],
                          ),
                        ),
                        Text(
                          quranModel.hasil[index].asma,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette.textColor,
                              fontWeight: FontWeight.bold),
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
          return Center(
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
      ),
    );
  }
}
