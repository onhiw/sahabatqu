import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:program/detail_program.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  List<String> imgList = [
    "assets/program1.png",
  ];

  List<String> contentList = [
    "SEDEKAH SERIBU SEHARI\n\nAssalaamu alaikum wa rahmatullahi wa barkaatuhu.\n.\nSahabat2ku fillah yang dirahmati oleh Allah..\n\nKami membuat Program Infaq 1.000/hari ini, berdasarkan perintah Allah..\n\nSimaklah Kalam Allah ini dg iman, “ Perumpamaan orang yg menginfakkan hartanya di jalan Allah seperti sebutir biji yg menumbuhkan tujuh tangkai, pada setiap tangkai ada seratus biji. Allah melipat gandakan bagi siapa yg Dia kehendaki, dan Allah Mahaluas, Maha Mengetahui” (QS Al-Baqarah 261)\n\nRasulullah bersabda..\n“Bersegeralah bersedekah, karena bala tidak pernah mendahului sedekah”\n(HR Thabrani).\n“Sedekah itu dapat menghapus dosa sebagaimana air itu memadamkan api“ (HR At-Tirmidzi).\n\nJadi dengan dasar itulah kami ingin mengajak semuanya untuk melakukan perbaikan kebaikan melalui atau berupaya semampu mungkin dengan ber-infaq..\n\nWalaupun nilainya 1.000/hari, tapi berharap Ridho Allah ada dalam nilai itu, berharap Allah turunkan keberkahan pada Rezeki kita, dan berharap yang tentunya masih banyak lagi janji Allah tentang ber-infaq atau bersedekah..\n\nJangan pernah remehkan sekecil apapun amal jariyah ini, walau serupiah, walau hanya doa, sahabat2ku..\n\nSelagi kita sehat..\nSelagi kita mampu..\nSelagi kita masih Allah berikan kesempatan hidup...\n\nYuk kita bersedekah..\n\nYa Allah..Berkahi amal Jariyah kami... Aamiin..."
  ];
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
            "Program Kami",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, programDetailRoute,
                    arguments: DetailProgramPage(
                      image: imgList[index],
                      content: contentList[index],
                    ));
              },
              child: IntrinsicHeight(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        imgList[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            // width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.65),
                                  spreadRadius: 20,
                                  blurRadius: 30,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              // color: Colors.black54
                            ),
                            child: const Center(
                                child: Text(
                              "Gerakan Sedekah Sehari Seribu",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
