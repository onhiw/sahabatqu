import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sahabatqu/pages/page-program/page_detail_program.dart';
import 'package:sahabatqu/pages/page-program/page_program.dart';

class ProgramWidget extends StatefulWidget {
  @override
  _ProgramWidgetState createState() => _ProgramWidgetState();
}

class _ProgramWidgetState extends State<ProgramWidget> {
  List<String> imgList = [
    "assets/program1.png",
  ];

  List<String> contentList = [
    "SEDEKAH SERIBU SEHARI\n" +
        "\n" +
        "Assalaamu alaikum wa rahmatullahi wa barkaatuhu.\n" +
        ".\n" +
        "Sahabat2ku fillah yang dirahmati oleh Allah..\n" +
        "\n" +
        "Kami membuat Program Infaq 1.000/hari ini, berdasarkan perintah Allah..\n" +
        "\n" +
        "Simaklah Kalam Allah ini dg iman, “ Perumpamaan orang yg menginfakkan hartanya di jalan Allah seperti sebutir biji yg menumbuhkan tujuh tangkai, pada setiap tangkai ada seratus biji. Allah melipat gandakan bagi siapa yg Dia kehendaki, dan Allah Mahaluas, Maha Mengetahui” (QS Al-Baqarah 261)\n" +
        "\n" +
        "Rasulullah bersabda..\n" +
        "“Bersegeralah bersedekah, karena bala tidak pernah mendahului sedekah”\n" +
        "(HR Thabrani).\n" +
        "“Sedekah itu dapat menghapus dosa sebagaimana air itu memadamkan api“ (HR At-Tirmidzi).\n" +
        "\n" +
        "Jadi dengan dasar itulah kami ingin mengajak semuanya untuk melakukan perbaikan kebaikan melalui atau berupaya semampu mungkin dengan ber-infaq..\n" +
        "\n" +
        "Walaupun nilainya 1.000/hari, tapi berharap Ridho Allah ada dalam nilai itu, berharap Allah turunkan keberkahan pada Rezeki kita, dan berharap yang tentunya masih banyak lagi janji Allah tentang ber-infaq atau bersedekah..\n" +
        "\n" +
        "Jangan pernah remehkan sekecil apapun amal jariyah ini, walau serupiah, walau hanya doa, sahabat2ku..\n" +
        "\n" +
        "Selagi kita sehat..\n" +
        "Selagi kita mampu..\n" +
        "Selagi kita masih Allah berikan kesempatan hidup...\n" +
        "\n" +
        "Yuk kita bersedekah..\n" +
        "\n" +
        "Ya Allah..Berkahi amal Jariyah kami... Aamiin..."
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Program",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : textColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProgramPage();
                  }));
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProgramDetailPage(
                        image: imgList[index], content: contentList[index]);
                  }));
                },
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imgList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gerakan Sedekah Sehari Seribu",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
