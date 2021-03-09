import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/models/doa_model.dart';
import 'package:sahabatqu/pages/page-doa/page_detail_doa.dart';

class DoaPage extends StatefulWidget {
  @override
  _DoaPageState createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  List<DoaModel> getDoaInformation() {
    List<DoaModel> doaModelList = new List<DoaModel>();
    doaModelList.add(new DoaModel(
        "1",
        "Doa Masuk Masjid",
        "اَللّٰهُمَّ افْتَحْ لِيْ اَبْوَابَ رَحْمَتِكٍَ",
        "Ya Allah, bukalah untukku pintu-pintu rahmat-Mu."));
    doaModelList.add(new DoaModel(
        "2",
        "Doa Keluar Masjid",
        "اَللّٰهُمَّ اِنِّى اَسْأَلُكَ مِنْ فَضْلِكَ",
        "Ya Allah, sesungguhnya aku memohon keutamaan dari-Mu"));
    doaModelList.add(new DoaModel(
        "3",
        "Doa Sebelum Makan",
        "الَّلهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا، وَقِنَا عَذَابَ النَّارِ",
        "Ya Allah, berkatilah rezeki yang engkau berikan kepada kami, dan peliharalah kami dari siksa api neraka"));
    doaModelList.add(new DoaModel(
        "4",
        "Doa Sesudah Makan",
        "اَلْحَمْدُ ِللهِ الَّذِيْنَ اَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَِ",
        "Segala puji bagi Allah yang memberi kami makan dan minum serta menjadikan kami memeluk agama islam"));
    doaModelList.add(new DoaModel(
        "5",
        "Doa Sesudah Wudhu",
        "اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِيْنَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِيْنَِ",
        "Ya Allah jadikanlah aku termasuk orang-orang yang bertaubat dan orang-orang yang bersuci”"));
    doaModelList.add(new DoaModel(
        "6",
        "Doa Ketika Mendapat Mimpi Baik",
        "بِسْمِكَ اللّهُمَّ اَحْيَا وَ بِسْمِكَ اَمُوْتُ",
        "Segala puji bagi Allah yang telah memberi hajatku"));
    doaModelList.add(new DoaModel(
        "7",
        "Doa Masuk Kamar Mandi",
        "باَللّٰهُمَّ اِنّىْ اَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَآئِثِ",
        "Ya Allah, aku berlindung pada-Mu dari godaan syetan  laki-laki dan syetan perempuan"));
    doaModelList.add(new DoaModel(
        "8",
        "Doa Istinja",
        "اَللّٰهُمَّ طَهِّرُ قَلْبِىْ مِنَ النِّفَاقِ وَحَصِّنْ فَرْخِىْ مِنَ الْفَوَاحِشِ",
        "Wahai Tuhanku, sucikanlah hatiku dari sifat kepura-puraan (munafiq) serta peliharalah kemaluanku dari perbuatan keji"));
    doaModelList.add(new DoaModel(
        "9",
        "Doa Masuk WC",
        "اَللّهُمَّ اِنِّيْ أَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَا إِثِ.ُ",
        "Wahai Tuhanku, sesungguhnya aku berlindung kepada-Mu dari segala kejahatan dan kotoran dan membuatku sehat"));
    doaModelList.add(new DoaModel(
        "10",
        "Doa Sebelum Tidur",
        "بِسْمِكَ اللّٰهُمَّ اَحْيَا وَاَمُوْتُُ",
        "Dengan menyebut nama-Mu, ya Tuhan, aku hidup dan aku mati"));
    doaModelList.add(new DoaModel(
        "11",
        "Doa Bangun Tidur",
        "اَلْحَمْدُ ِللهِ الَّذِىْ اَحْيَانَا بَعْدَمَآ اَمَاتَنَا وَاِلَيْهِ النُّشُوْرُ",
        "Segala puji bagi Allah yang menghidupkan kita setelah kita mati (bangun dari tidur) dan hanya kepada-Nya kita kembali"));
    doaModelList.add(new DoaModel(
        "12",
        "Doa Mengenakan Pakaian",
        "بِسْمِ اللهِ اَللّٰهُمَّ اِنِّى اَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَاهُوَ لَهُ وَاَعُوْذُبِكَ مِنَُ",
        "Dengan nama-Mu yaa Allah akku minta kepada Engkau kebaikan pakaian ini dan kebaikan apa yang ada padanya, dan aku berlindung kepada Engkau dari kejahatan pakaian ini dan kejahatan yang ada padanya"));
    doaModelList.add(new DoaModel(
        "13",
        "Doa Melepas Pakaian",
        "بِسْمِ اللهِ الَّذِيْ لاَ إِلَهَ إِلَّا هُوَ",
        "Dalam nama Tuhan tidak ada Tuhan selain dia"));
    doaModelList.add(new DoaModel(
        "14",
        "Doa Pengetahuan yang Berguna",
        "اَللّٰهُمَّ اِنِّى اَسْأَلُكَ عِلْمًا نَافِعًا وَرِزْقًا طَيِّبًا وَعَمَلاً مُتَقَبَّلاً",
        "Ya Allah, sesungguhnya aku bertanya kepadamu pengetahuan yang berguna, rezeki yang baik dan perbuatan baik yang Diterima (HR Ibn Majah)"));
    doaModelList.add(new DoaModel(
        "15",
        "Doa sebelum belajar",
        "رَبِّ زِدْنِي عِلْمًا، وَارْزُقْنِيْ فَهْمًا وَاجْعَلْنِيْ مِنَ الصَّالِحِيْنَ",
        "Ya Alloh Tambahkanlah aku ilmu, Dan berilah aku karunia untuk dapat memahaminya, Dan jadikanlah aku termasuk golongannya orang-orang yang shoolih. Ya Alloh kabulkanlah doaku ini"));
    doaModelList.add(new DoaModel(
        "16",
        "Doa sesudah belajar",
        "اَللَّهُمَّ أَرِنَا الْحَقَّ حَقًّا وَارْزُقْنَا اتِّـبَاعَه وَأَرِنَا الْبَاطِلَ بَاطِلاً وَارْزُقْنَا اجْتِنَابَهُ",
        "Ya Alloh, tunjukkanlah kepada kami kebenaran sehinggga kami dapat mengikutinya. Dan tunjukkanlah kepada kami kejelekan sehingga kami dapat menjauhinya"));
    doaModelList.add(new DoaModel(
        "17",
        "Doa menyambut pagi hari",
        "اَللّٰهُمَّ بِكَ اَصْبَحْنَا وَبِكَ اَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَاِلَيْكَ النُّشُوْرَُ",
        "Ya Allah, karena Engkau kami mengalami waktu pagi dan waktu petang, dan karena Engkau kami hidup dan mati dan kepada-Mu juga kami akan kembali"));
    doaModelList.add(new DoaModel(
        "18",
        "Doa menjelang saat petang",
        "اَللّٰهُمَّ بِكَ اَمْسَيْنَا وَبِكَ اَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَاِلَيْكَ الْمَصِيْرُ",
        "Ya Allah, karena Engkau kami mengalami waktu petang dan waktu pagi, karena Engkau kami hidup dan mati dan kepada-Mu juga kami akan kembali"));
    doaModelList.add(new DoaModel(
        "19",
        "Doa ketika bercermin",
        "اَللَّهُـمَّ كَمَا حَسَّـنْتَ خَلْقِـيْ فَحَسِّـنْ خُلُقِـيَْ",
        "Ya Allah sebagaimana Engkau telah ciptakan aku dengan baik, maka perbaikilah akhlakku"));
    doaModelList.add(new DoaModel(
        "20",
        "Doa agar diberi rezeki yang berkah",
        "اَلْحَمْدُ ِللهِ الَّذِىْ رَزَقَنِىْ هذَا مِنْ خَيْرِ حَوْلٍ مِنِّى وَلاَقُوَّةٍ، اَللهُمَّ بَارِكْ فِيْهِ  َ",
        "Segala puji bagi Allah, yang telah memberi rizqi kepadaku dengan tidak ada daya dan kekuatan bagiku, ya Allah semoga Engkau berkahi pada rizkiku"));
    return doaModelList;
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
            "Kumpulan Doa-Doa",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: getDoaInformation().length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DoaDetailPage(
                    title: getDoaInformation()[index].nama,
                    arab: getDoaInformation()[index].arab,
                    arti: getDoaInformation()[index].arti);
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
                          getDoaInformation()[index].nomor + ".",
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
                                getDoaInformation()[index].nama,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorPalette.themeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
