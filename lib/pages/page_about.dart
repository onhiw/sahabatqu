import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String bio =
      "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم\n\n“Dan bagi tiap-tiap umat ada kiblatnya (sendiri) yang ia menghadap kepadanya. Maka berlomba-lombalah (dalam membuat) kebaikan. Di mana saja kamu berada pasti Allah akan mengumpulkan kamu sekalian (pada hari kiamat). Sesungguhnya Allah Maha Kuasa atas segala sesuatu. (QS. Al-Baqarah, 2: 148)\n\n❤Sekilas Tentang Kami❤\n\nSahabat Az-Zikra Purwakarta terbentuk dari kegiatan rutin kami mengikuti Dzikir Akbar di Masjid Az Zikra Sentul Bogor bersama gurunda Almarhum KH. Ust. Muhammad Arifin Ilham. Dari itu kami mempunyai kegiatan harian seperti Infaq seribu sehari,  mengingatkan amalan yaumiyah,  pun sharing berbagai Ilmu Keagamaan. Kami pun mengadakan berbagai rangkaian kegiatan rutin pada bulan Ramadhan dengan membuka peluang kebaikan berdonasi untuk acara Santunan dan Buka Bersama Anak Yatim Piatu dan Dhuafa,  Games Edukatif,  Bagi-bagi Ifhtor,  Sebar Infaq untuk Pembangunan dan Sarana Prasarana Pesantren, Mesjid dan Majlis Taklim. Disini kami berusaha untuk senantiasa Fastabiqul Khairat sebagaimana harapan kami adalah Alloh satukan Kami di Surga-Nya kelak untuk sahabat yang saling mencintai karena Alloh.\n\nٱلْأَخِلَّآءُ يَوْمَئِذٍۭ بَعْضُهُمْ لِبَعْضٍ عَدُوٌّ إِلَّا ٱلْمُتَّقِينَ ﴿٦٧﴾\n\nTeman-teman akrab pada hari itu sebagiannya menjadi musuh bagi sebagian yang lain kecuali orang-orang yang bertakwa.(Q.S.43:67)";
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark
          ? ColorPalette.bgDarkColor
          : Colors.grey[100],
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Tentang Kami",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 16,
          ),
          Image.asset(
            "assets/logowhite.png",
            width: 150,
            height: 150,
            color: ColorPalette.themeColor,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Hubungi Kami Di :",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/facebook.png",
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Image.asset("assets/instagram.jpg", width: 40, height: 40),
              SizedBox(
                width: 8,
              ),
              Image.asset("assets/wa.png", width: 40, height: 40),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
