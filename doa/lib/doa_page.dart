import 'package:core/core.dart';
import 'package:doa/detail_doa_page.dart';
import 'package:doa/models/doa_model.dart';
import 'package:flutter/material.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  DoaPageState createState() => DoaPageState();
}

class DoaPageState extends State<DoaPage> {
  List<DoaModel> getDoaInformation() {
    List<DoaModel> doaModelList = [];
    doaModelList.add(DoaModel(
        "1",
        "Doa Masuk Masjid",
        "اَللّٰهُمَّ افْتَحْ لِيْ اَبْوَابَ رَحْمَتِكٍَ",
        "Ya Allah, bukalah untukku pintu-pintu rahmat-Mu."));
    doaModelList.add(DoaModel(
        "2",
        "Doa Keluar Masjid",
        "اَللّٰهُمَّ اِنِّى اَسْأَلُكَ مِنْ فَضْلِكَ",
        "Ya Allah, sesungguhnya aku memohon keutamaan dari-Mu"));
    doaModelList.add(DoaModel(
        "3",
        "Doa Sebelum Makan",
        "الَّلهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا، وَقِنَا عَذَابَ النَّارِ",
        "Ya Allah, berkatilah rezeki yang engkau berikan kepada kami, dan peliharalah kami dari siksa api neraka"));
    doaModelList.add(DoaModel(
        "4",
        "Doa Sesudah Makan",
        "اَلْحَمْدُ ِللهِ الَّذِيْنَ اَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَِ",
        "Segala puji bagi Allah yang memberi kami makan dan minum serta menjadikan kami memeluk agama islam"));
    doaModelList.add(DoaModel(
        "5",
        "Doa Sesudah Wudhu",
        "اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِيْنَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِيْنَِ",
        "Ya Allah jadikanlah aku termasuk orang-orang yang bertaubat dan orang-orang yang bersuci”"));
    doaModelList.add(DoaModel(
        "6",
        "Doa Ketika Mendapat Mimpi Baik",
        "بِسْمِكَ اللّهُمَّ اَحْيَا وَ بِسْمِكَ اَمُوْتُ",
        "Segala puji bagi Allah yang telah memberi hajatku"));
    doaModelList.add(DoaModel(
        "7",
        "Doa Masuk Kamar Mandi",
        "باَللّٰهُمَّ اِنّىْ اَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَآئِثِ",
        "Ya Allah, aku berlindung pada-Mu dari godaan syetan  laki-laki dan syetan perempuan"));
    doaModelList.add(DoaModel(
        "8",
        "Doa Istinja",
        "اَللّٰهُمَّ طَهِّرُ قَلْبِىْ مِنَ النِّفَاقِ وَحَصِّنْ فَرْخِىْ مِنَ الْفَوَاحِشِ",
        "Wahai Tuhanku, sucikanlah hatiku dari sifat kepura-puraan (munafiq) serta peliharalah kemaluanku dari perbuatan keji"));
    doaModelList.add(DoaModel(
        "9",
        "Doa Masuk WC",
        "اَللّهُمَّ اِنِّيْ أَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَا إِثِ.ُ",
        "Wahai Tuhanku, sesungguhnya aku berlindung kepada-Mu dari segala kejahatan dan kotoran dan membuatku sehat"));
    doaModelList.add(DoaModel(
        "10",
        "Doa Sebelum Tidur",
        "بِسْمِكَ اللّٰهُمَّ اَحْيَا وَاَمُوْتُُ",
        "Dengan menyebut nama-Mu, ya Tuhan, aku hidup dan aku mati"));
    doaModelList.add(DoaModel(
        "11",
        "Doa Bangun Tidur",
        "اَلْحَمْدُ ِللهِ الَّذِىْ اَحْيَانَا بَعْدَمَآ اَمَاتَنَا وَاِلَيْهِ النُّشُوْرُ",
        "Segala puji bagi Allah yang menghidupkan kita setelah kita mati (bangun dari tidur) dan hanya kepada-Nya kita kembali"));
    doaModelList.add(DoaModel(
        "12",
        "Doa Mengenakan Pakaian",
        "بِسْمِ اللهِ اَللّٰهُمَّ اِنِّى اَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَاهُوَ لَهُ وَاَعُوْذُبِكَ مِنَُ",
        "Dengan nama-Mu yaa Allah akku minta kepada Engkau kebaikan pakaian ini dan kebaikan apa yang ada padanya, dan aku berlindung kepada Engkau dari kejahatan pakaian ini dan kejahatan yang ada padanya"));
    doaModelList.add(DoaModel(
        "13",
        "Doa Melepas Pakaian",
        "بِسْمِ اللهِ الَّذِيْ لاَ إِلَهَ إِلَّا هُوَ",
        "Dalam nama Tuhan tidak ada Tuhan selain dia"));
    doaModelList.add(DoaModel(
        "14",
        "Doa Pengetahuan yang Berguna",
        "اَللّٰهُمَّ اِنِّى اَسْأَلُكَ عِلْمًا نَافِعًا وَرِزْقًا طَيِّبًا وَعَمَلاً مُتَقَبَّلاً",
        "Ya Allah, sesungguhnya aku bertanya kepadamu pengetahuan yang berguna, rezeki yang baik dan perbuatan baik yang Diterima (HR Ibn Majah)"));
    doaModelList.add(DoaModel(
        "15",
        "Doa sebelum belajar",
        "رَبِّ زِدْنِي عِلْمًا، وَارْزُقْنِيْ فَهْمًا وَاجْعَلْنِيْ مِنَ الصَّالِحِيْنَ",
        "Ya Alloh Tambahkanlah aku ilmu, Dan berilah aku karunia untuk dapat memahaminya, Dan jadikanlah aku termasuk golongannya orang-orang yang shoolih. Ya Alloh kabulkanlah doaku ini"));
    doaModelList.add(DoaModel(
        "16",
        "Doa sesudah belajar",
        "اَللَّهُمَّ أَرِنَا الْحَقَّ حَقًّا وَارْزُقْنَا اتِّـبَاعَه وَأَرِنَا الْبَاطِلَ بَاطِلاً وَارْزُقْنَا اجْتِنَابَهُ",
        "Ya Alloh, tunjukkanlah kepada kami kebenaran sehinggga kami dapat mengikutinya. Dan tunjukkanlah kepada kami kejelekan sehingga kami dapat menjauhinya"));
    doaModelList.add(DoaModel(
        "17",
        "Doa menyambut pagi hari",
        "اَللّٰهُمَّ بِكَ اَصْبَحْنَا وَبِكَ اَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَاِلَيْكَ النُّشُوْرَُ",
        "Ya Allah, karena Engkau kami mengalami waktu pagi dan waktu petang, dan karena Engkau kami hidup dan mati dan kepada-Mu juga kami akan kembali"));
    doaModelList.add(DoaModel(
        "18",
        "Doa menjelang saat petang",
        "اَللّٰهُمَّ بِكَ اَمْسَيْنَا وَبِكَ اَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَاِلَيْكَ الْمَصِيْرُ",
        "Ya Allah, karena Engkau kami mengalami waktu petang dan waktu pagi, karena Engkau kami hidup dan mati dan kepada-Mu juga kami akan kembali"));
    doaModelList.add(DoaModel(
        "19",
        "Doa ketika bercermin",
        "اَللَّهُـمَّ كَمَا حَسَّـنْتَ خَلْقِـيْ فَحَسِّـنْ خُلُقِـيَْ",
        "Ya Allah sebagaimana Engkau telah ciptakan aku dengan baik, maka perbaikilah akhlakku"));
    doaModelList.add(DoaModel(
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
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
          ),
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          elevation: 0,
          title: Text(
            "Kumpulan Doa-Doa",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: getDoaInformation().length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailDoaPage(
                    title: getDoaInformation()[index].nama,
                    arab: getDoaInformation()[index].arab,
                    arti: getDoaInformation()[index].arti);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "${getDoaInformation()[index].nomor!}.",
                          style: TextStyle(
                              fontSize: 16,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getDoaInformation()[index].nama!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: themeColor,
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
          return const Divider(
            thickness: 1,
          );
        },
      ),
    );
  }
}