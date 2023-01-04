import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/models/asma_model.dart';

class NamesAllahPage extends StatefulWidget {
  @override
  _NamesAllahPageState createState() => _NamesAllahPageState();
}

class _NamesAllahPageState extends State<NamesAllahPage> {
  List<Asma> getAsmaInformation() {
    List<Asma> dataList = [];
    dataList.add(new Asma("", "الله", "Allah", "Allah"));
    dataList.add(new Asma("1", "الرحمن", "Ar Rahman", "Yang Maha Pengasih"));
    dataList.add(new Asma("2", "الرحيم", "Ar Rahiim", "Yang Maha Penyayang"));
    dataList.add(
        new Asma("3", "الملك", "Al Malik", "Yang Maha Merajai / Memerintah"));
    dataList.add(new Asma("4", "القدوس", "Al Quddus", "Yang Maha Suci"));
    dataList.add(new Asma(
        "5", "السلام", "As Salaam", "Yang Maha Memberi Kesejahteraan"));
    dataList.add(
        new Asma("6", "المؤمن", "Al Mu`min", "Yang Maha Memberi Keamanan"));
    dataList
        .add(new Asma("7", "المهيمن", "Al Muhaimin", "Yang Maha Pemelihara"));
    dataList.add(new Asma(
        "8", "العزيز", "Al `Aziiz", "Yang Maha PerkasaYang Maha Perkasa"));
    dataList.add(
        new Asma("9", "الجبار", "Al Jabbar", "Yang Memiliki Mutlak Kegagahan"));
    dataList.add(new Asma("10", "المتكبر", "Al Mutakabbir",
        "Yang Maha Megah, Yang Memiliki Kebesaran"));
    dataList.add(new Asma("11", "الخالق", "Al Khaliq", "Yang Maha Pencipta"));
    dataList.add(new Asma("12", "البارئ", "Al Baari`",
        "Yang Maha Melepaskan (Membuat, Membentuk, Menyeimbangkan)"));
    dataList.add(new Asma("13", "المصور", "Al Mushawwir",
        "Yang Maha Membentuk Rupa (makhluknya)"));
    dataList
        .add(new Asma("14", "الغفار", "Al Ghaffaar", "Yang Maha Pengampun"));
    dataList
        .add(new Asma("15", "القهار", "Al Qahhaar", "Yang Maha Menundukan"));
    dataList.add(
        new Asma("16", "الوهاب", "Al Wahhaab", "Yang Maha Pemberi Karunia"));
    dataList.add(
        new Asma("17", "الرزاق", "Ar Razzaaq", "Yang Maha Pemberi Rezeki"));
    dataList.add(
        new Asma("18", "الفتاح", "Al Fattaah", "Yang Maha Pembuka Rahmat"));
    dataList.add(new Asma(
        "19", "العليم", "Al `Aliim", "Yang Maha Mengetahui (Memiliki Ilmu)"));
    dataList.add(new Asma(
        "20", "القابض", "Al Qaabidh", "Yang Maha Menyempitkan (makhluknya)"));
    dataList.add(new Asma(
        "21", "الباسط", "Al Baasith", "Yang Maha Melapangkan (makhluknya)"));
    dataList.add(new Asma(
        "22", "الخافض", "Al Khaafidh", "Yang Maha Merendahkan (makhluknya)"));
    dataList.add(new Asma(
        "23", "الرافع", "Ar Raafi`", "Yang Maha Meninggikan (makhluknya)"));
    dataList.add(new Asma(
        "24", "المعز", "Al Mu`izz", "Yang Maha Memuliakan (makhluknya)"));
    dataList.add(new Asma(
        "25", "المذل", "Al Mudzil", "Yang Maha Menghinakan (makhluknya)"));
    dataList.add(new Asma("26", "السميع", "Al Samii`", "Yang Maha Mendengar"));
    dataList.add(new Asma("27", "البصير", "Al Bashiir", "Yang Maha Melihat"));
    dataList.add(new Asma("28", "الحكم,", "Al Hakam", "Yang Maha Menetapkan"));
    dataList.add(new Asma("29", "العدل", "Al `Adl", "Yang Maha Adil"));
    dataList.add(new Asma("30", "اللطيف", "Al Lathiif", "Yang Maha Lembut"));
    dataList.add(new Asma("31", "الخبير", "Al Khabiir", "Yang Maha Mengenal"));
    dataList.add(new Asma("32", "الحليم", "Al Haliim", "Yang Maha Penyantun"));
    dataList
        .add(new Asma("33", "العظيم", "Al `Azhiim", "Allah Yang Maha Agung"));
    dataList.add(new Asma(
        "34", "الغفور", "Al Ghafuur", "Allah Yang Maha Memberi Pengampunan"));
    dataList.add(new Asma("35", "الشكور", "As Syakuur",
        "Allah Yang Maha Pembalas Budi (Menghargai)"));
    dataList.add(new Asma("36", "العلى", "Al `Aliy", "Allah Yang Maha Tinggi"));
    dataList.add(new Asma("37", "الكبير", "Al Kabiir", "Yang Maha Besar"));
    dataList.add(
        new Asma("38", "الحفيظ", "Al Hafizh", "Allah Yang Maha Memelihara"));
    dataList.add(new Asma(
        "39", "المقيت", "Al Muqiit", "Allah Yang Maha Pemberi Kecukupan"));
    dataList.add(new Asma(
        "40", "الحسيب", "Al Hasiib", "Allah Yang Maha Membuat Perhitungan"));
    dataList
        .add(new Asma("41", "الجليل", "Al Jaliil", "Allah Yang Maha Luhur"));
    dataList
        .add(new Asma("42", "الكريم", "Al Kariim", "Allah Yang Maha Pemurah"));
    dataList.add(
        new Asma("43", "الرقيب", "Ar Raqiib", "Allah Yang Maha Mengawasi"));
    dataList.add(
        new Asma("44", "المجيب", "Al Mujiib", "Allah Yang Maha Mengabulkan"));
    dataList.add(new Asma("45", "الواسع", "Al Waasi`", "Allah Yang Maha Luas"));
    dataList
        .add(new Asma("46", "الحكيم", "Al Hakim", "Allah Yang Maha Bijaksana"));
    dataList.add(
        new Asma("47", "الودود", "Al Waduud", "Allah Yang Maha Mengasihi"));
    dataList
        .add(new Asma("48", "المجيد", "Al Majiid", "Allah Yang Maha Mulia"));
    dataList.add(new Asma(
        "49", "الباعث", "Al Baa`its", "Allah Yang Maha Membangkitkan"));
    dataList.add(
        new Asma("50", "الشهيد", "As Syahiid", "Allah Yang Maha Menyaksikan"));
    dataList.add(new Asma("51", "الحق", "Al Haqq", "Allah Yang Maha Benar"));
    dataList.add(
        new Asma("52", "الوكيل", "Al Wakiil", "Allah Yang Maha Memelihara"));
    dataList.add(new Asma("53", "القوى", "Al Qawiyyu", "Allah Yang Maha Kuat"));
    dataList
        .add(new Asma("54", "المتين", "Al Matiin", "Allah Yang Maha Kokoh"));
    dataList.add(
        new Asma("55", "الولى", "Al Waliyy", "Allah Yang Maha Melindungi"));
    dataList
        .add(new Asma("56", "الحميد", "Al Hamiid", "Allah Yang Maha Terpuji"));
    dataList.add(new Asma("57", "المحصى", "Al Muhshii",
        "Allah Yang Maha Mengalkulasi (Menghitung Segala Sesuatu)"));
    dataList
        .add(new Asma("58", "المبدئ", "Al Mubdi`", "Allah Yang Maha Memulai"));
    dataList.add(new Asma("59", "المعيد", "Al Mu`iid",
        "Allah Yang Maha Mengembalikan Kehidupan"));
    dataList.add(
        new Asma("60", "المحيى", "Al Muhyii", "Allah Yang Maha Menghidupkan"));
    dataList.add(
        new Asma("61", "المميت", "Al Mumiitu", "Allah Yang Maha Mematikan"));
    dataList.add(new Asma("62", "الحي", "Al Hayyu", "Allah Yang Maha Hidup"));
    dataList
        .add(new Asma("63", "القيوم", "Al Qayyuum", "Allah Yang Maha Mandiri"));
    dataList
        .add(new Asma("64", "الواجد", "Al Waajid", "Allah Yang Maha Penemu"));
    dataList
        .add(new Asma("65", "الماجد", "Al Maajid", "Allah Yang Maha Mulia"));
    dataList
        .add(new Asma("66", "الواحد", "Al Wahid", "Allah Yang Maha Tunggal"));
    dataList.add(new Asma("67", "الاحد", "Al Ahad", "Allah Yang Maha Esa"));
    dataList.add(new Asma("68", "الصمد", "As Shamad",
        "Allah Yang Maha Dibutuhkan, Tempat Meminta"));
    dataList.add(new Asma("69", "القادر", "Al Qaadir",
        "Allah Yang Maha Menentukan, Maha Menyeimbangkan"));
    dataList.add(
        new Asma("70", "المقتدر", "Al Muqtadir", "Allah Yang Maha Berkuasa"));
    dataList.add(new Asma(
        "71", "المقدم", "Al Muqaddim", "Allah Yang Maha Mendahulukan"));
    dataList.add(new Asma(
        "72", "المؤخر", "Al Mu`akkhir", "Allah Yang Maha Mengakhirkan"));
    dataList.add(new Asma("73", "الأول", "Al Awwal", "Allah Yang Maha Awal"));
    dataList.add(new Asma("74", "الأخر", "Al Aakhir", "Allah Yang Maha Akhir"));
    dataList
        .add(new Asma("75", "الظاهر", "Az Zhaahir", "Allah Yang Maha Nyata"));
    dataList
        .add(new Asma("76", "الباطن", "Al Baathin", "Allah Yang Maha Ghaib"));
    dataList.add(
        new Asma("77", "الوالي", "Al Waali", "Allah Yang Maha Memerintah"));
    dataList.add(
        new Asma("78", "المتعالي", "Al Muta`aalii", "Allah Yang Maha Tinggi"));
    dataList.add(new Asma("79", "البر", "Al Barru",
        "Allah Yang Maha Penderma (Maha Pemberi Kebajikan)"));
    dataList.add(new Asma(
        "80", "التواب", "At Tawwaab", "Allah Yang Maha Penerima Tobat"));
    dataList.add(new Asma(
        "81", "المنتقم", "Al Muntaqim", "Allah Yang Maha Pemberi Balasan"));
    dataList.add(new Asma("82", "العفو", "Al Afuww", "Allah Yang Maha Pemaaf"));
    dataList
        .add(new Asma("83", "الرؤوف", "Ar Ra`uuf", "Allah Yang Maha Pengasuh"));
    dataList.add(new Asma("84", "مالك الملك", "Malikul Mulk",
        "Allah Yang Maha Penguasa Kerajaan (Semesta)"));
    dataList.add(new Asma(
        "85",
        "ذو الجلال و الإكرام",
        "Dzul Jalaali Wal Ikraam",
        "Allah Yang Maha Pemilik Kebesaran dan Kemuliaan"));
    dataList.add(new Asma(
        "86", "المقسط", "Al Muqsith", "Allah Yang Maha Pemberi Keadilan"));
    dataList.add(
        new Asma("87", "الجامع", "Al Jamii`", "Allah Yang Maha Mengumpulkan"));
    dataList.add(new Asma("88", "الغنى", "Al Ghaniyy", "Allah Yang Maha Kaya"));
    dataList.add(new Asma(
        "89", "المغنى", "Al Mughnii", "Allah Yang Maha Pemberi Kekayaan"));
    dataList
        .add(new Asma("90", "المانع", "Al Maani", "Allah Yang Maha Mencegah"));
    dataList.add(new Asma(
        "91", "الضار", "Ad Dhaar", "Allah Yang Maha Penimpa Kemudharatan"));
    dataList.add(new Asma(
        "92", "النافع", "An Nafii`", "Allah Yang Maha Memberi Manfaat"));
    dataList.add(new Asma("93", "النور", "An Nuur",
        "Allah Yang Maha Bercahaya (Menerangi, Memberi Cahaya)"));
    dataList.add(new Asma(
        "94", "الهادئ", "Al Haadii", "Allah Yang Maha Pemberi Petunjuk"));
    dataList.add(new Asma("95", "البديع", "Al Badii’",
        "Allah Yang Maha Pencipta Yang Tiada Bandingannya"));
    dataList
        .add(new Asma("96", "الباقي", "Al Baaqii", "Allah Yang Maha Kekal"));
    dataList
        .add(new Asma("97", "الوارث", "Al Waarits", "Allah Yang Maha Pewaris"));
    dataList
        .add(new Asma("98", "الرشيد", "Ar Rasyiid", "Allah Yang Maha Pandai"));
    dataList
        .add(new Asma("99", "الصبور", "As Shabuur", "Allah Yang Maha Sabar"));

    return dataList;
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
            "Asma Al-Husna",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: getAsmaInformation().length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          getAsmaInformation()[index].no == ""
                              ? getAsmaInformation()[index].no! + " "
                              : getAsmaInformation()[index].no! + ".",
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
                                getAsmaInformation()[index].bacaan!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorPalette.themeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                getAsmaInformation()[index].arti!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      getAsmaInformation()[index].ayat!,
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
      ),
    );
  }
}
