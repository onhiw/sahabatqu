import 'package:asma/models/asma_model.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AsmaPage extends StatefulWidget {
  const AsmaPage({super.key});

  @override
  State<AsmaPage> createState() => _AsmaPageState();
}

class _AsmaPageState extends State<AsmaPage> {
  List<AsmaModel> dataList = [];

  void _getAsmaInformation() {
    setState(() {
      dataList.add(AsmaModel("", "الله", "Allah", "Allah"));
      dataList.add(AsmaModel("1", "الرحمن", "Ar Rahman", "Yang Maha Pengasih"));
      dataList
          .add(AsmaModel("2", "الرحيم", "Ar Rahiim", "Yang Maha Penyayang"));
      dataList.add(AsmaModel(
          "3", "الملك", "Al Malik", "Yang Maha Merajai / Memerintah"));
      dataList.add(AsmaModel("4", "القدوس", "Al Quddus", "Yang Maha Suci"));
      dataList.add(AsmaModel(
          "5", "السلام", "As Salaam", "Yang Maha Memberi Kesejahteraan"));
      dataList.add(
          AsmaModel("6", "المؤمن", "Al Mu`min", "Yang Maha Memberi Keamanan"));
      dataList.add(
          AsmaModel("7", "المهيمن", "Al Muhaimin", "Yang Maha Pemelihara"));
      dataList.add(AsmaModel(
          "8", "العزيز", "Al `Aziiz", "Yang Maha PerkasaYang Maha Perkasa"));
      dataList.add(AsmaModel(
          "9", "الجبار", "Al Jabbar", "Yang Memiliki Mutlak Kegagahan"));
      dataList.add(AsmaModel("10", "المتكبر", "Al Mutakabbir",
          "Yang Maha Megah, Yang Memiliki Kebesaran"));
      dataList
          .add(AsmaModel("11", "الخالق", "Al Khaliq", "Yang Maha Pencipta"));
      dataList.add(AsmaModel("12", "البارئ", "Al Baari`",
          "Yang Maha Melepaskan (Membuat, Membentuk, Menyeimbangkan)"));
      dataList.add(AsmaModel("13", "المصور", "Al Mushawwir",
          "Yang Maha Membentuk Rupa (makhluknya)"));
      dataList
          .add(AsmaModel("14", "الغفار", "Al Ghaffaar", "Yang Maha Pengampun"));
      dataList
          .add(AsmaModel("15", "القهار", "Al Qahhaar", "Yang Maha Menundukan"));
      dataList.add(
          AsmaModel("16", "الوهاب", "Al Wahhaab", "Yang Maha Pemberi Karunia"));
      dataList.add(
          AsmaModel("17", "الرزاق", "Ar Razzaaq", "Yang Maha Pemberi Rezeki"));
      dataList.add(
          AsmaModel("18", "الفتاح", "Al Fattaah", "Yang Maha Pembuka Rahmat"));
      dataList.add(AsmaModel(
          "19", "العليم", "Al `Aliim", "Yang Maha Mengetahui (Memiliki Ilmu)"));
      dataList.add(AsmaModel(
          "20", "القابض", "Al Qaabidh", "Yang Maha Menyempitkan (makhluknya)"));
      dataList.add(AsmaModel(
          "21", "الباسط", "Al Baasith", "Yang Maha Melapangkan (makhluknya)"));
      dataList.add(AsmaModel(
          "22", "الخافض", "Al Khaafidh", "Yang Maha Merendahkan (makhluknya)"));
      dataList.add(AsmaModel(
          "23", "الرافع", "Ar Raafi`", "Yang Maha Meninggikan (makhluknya)"));
      dataList.add(AsmaModel(
          "24", "المعز", "Al Mu`izz", "Yang Maha Memuliakan (makhluknya)"));
      dataList.add(AsmaModel(
          "25", "المذل", "Al Mudzil", "Yang Maha Menghinakan (makhluknya)"));
      dataList
          .add(AsmaModel("26", "السميع", "Al Samii`", "Yang Maha Mendengar"));
      dataList
          .add(AsmaModel("27", "البصير", "Al Bashiir", "Yang Maha Melihat"));
      dataList
          .add(AsmaModel("28", "الحكم,", "Al Hakam", "Yang Maha Menetapkan"));
      dataList.add(AsmaModel("29", "العدل", "Al `Adl", "Yang Maha Adil"));
      dataList.add(AsmaModel("30", "اللطيف", "Al Lathiif", "Yang Maha Lembut"));
      dataList
          .add(AsmaModel("31", "الخبير", "Al Khabiir", "Yang Maha Mengenal"));
      dataList
          .add(AsmaModel("32", "الحليم", "Al Haliim", "Yang Maha Penyantun"));
      dataList.add(
          AsmaModel("33", "العظيم", "Al `Azhiim", "Allah Yang Maha Agung"));
      dataList.add(AsmaModel(
          "34", "الغفور", "Al Ghafuur", "Allah Yang Maha Memberi Pengampunan"));
      dataList.add(AsmaModel("35", "الشكور", "As Syakuur",
          "Allah Yang Maha Pembalas Budi (Menghargai)"));
      dataList
          .add(AsmaModel("36", "العلى", "Al `Aliy", "Allah Yang Maha Tinggi"));
      dataList.add(AsmaModel("37", "الكبير", "Al Kabiir", "Yang Maha Besar"));
      dataList.add(
          AsmaModel("38", "الحفيظ", "Al Hafizh", "Allah Yang Maha Memelihara"));
      dataList.add(AsmaModel(
          "39", "المقيت", "Al Muqiit", "Allah Yang Maha Pemberi Kecukupan"));
      dataList.add(AsmaModel(
          "40", "الحسيب", "Al Hasiib", "Allah Yang Maha Membuat Perhitungan"));
      dataList
          .add(AsmaModel("41", "الجليل", "Al Jaliil", "Allah Yang Maha Luhur"));
      dataList.add(
          AsmaModel("42", "الكريم", "Al Kariim", "Allah Yang Maha Pemurah"));
      dataList.add(
          AsmaModel("43", "الرقيب", "Ar Raqiib", "Allah Yang Maha Mengawasi"));
      dataList.add(AsmaModel(
          "44", "المجيب", "Al Mujiib", "Allah Yang Maha Mengabulkan"));
      dataList
          .add(AsmaModel("45", "الواسع", "Al Waasi`", "Allah Yang Maha Luas"));
      dataList.add(
          AsmaModel("46", "الحكيم", "Al Hakim", "Allah Yang Maha Bijaksana"));
      dataList.add(
          AsmaModel("47", "الودود", "Al Waduud", "Allah Yang Maha Mengasihi"));
      dataList
          .add(AsmaModel("48", "المجيد", "Al Majiid", "Allah Yang Maha Mulia"));
      dataList.add(AsmaModel(
          "49", "الباعث", "Al Baa`its", "Allah Yang Maha Membangkitkan"));
      dataList.add(AsmaModel(
          "50", "الشهيد", "As Syahiid", "Allah Yang Maha Menyaksikan"));
      dataList.add(AsmaModel("51", "الحق", "Al Haqq", "Allah Yang Maha Benar"));
      dataList.add(
          AsmaModel("52", "الوكيل", "Al Wakiil", "Allah Yang Maha Memelihara"));
      dataList
          .add(AsmaModel("53", "القوى", "Al Qawiyyu", "Allah Yang Maha Kuat"));
      dataList
          .add(AsmaModel("54", "المتين", "Al Matiin", "Allah Yang Maha Kokoh"));
      dataList.add(
          AsmaModel("55", "الولى", "Al Waliyy", "Allah Yang Maha Melindungi"));
      dataList.add(
          AsmaModel("56", "الحميد", "Al Hamiid", "Allah Yang Maha Terpuji"));
      dataList.add(AsmaModel("57", "المحصى", "Al Muhshii",
          "Allah Yang Maha Mengalkulasi (Menghitung Segala Sesuatu)"));
      dataList.add(
          AsmaModel("58", "المبدئ", "Al Mubdi`", "Allah Yang Maha Memulai"));
      dataList.add(AsmaModel("59", "المعيد", "Al Mu`iid",
          "Allah Yang Maha Mengembalikan Kehidupan"));
      dataList.add(AsmaModel(
          "60", "المحيى", "Al Muhyii", "Allah Yang Maha Menghidupkan"));
      dataList.add(
          AsmaModel("61", "المميت", "Al Mumiitu", "Allah Yang Maha Mematikan"));
      dataList
          .add(AsmaModel("62", "الحي", "Al Hayyu", "Allah Yang Maha Hidup"));
      dataList.add(
          AsmaModel("63", "القيوم", "Al Qayyuum", "Allah Yang Maha Mandiri"));
      dataList.add(
          AsmaModel("64", "الواجد", "Al Waajid", "Allah Yang Maha Penemu"));
      dataList
          .add(AsmaModel("65", "الماجد", "Al Maajid", "Allah Yang Maha Mulia"));
      dataList.add(
          AsmaModel("66", "الواحد", "Al Wahid", "Allah Yang Maha Tunggal"));
      dataList.add(AsmaModel("67", "الاحد", "Al Ahad", "Allah Yang Maha Esa"));
      dataList.add(AsmaModel("68", "الصمد", "As Shamad",
          "Allah Yang Maha Dibutuhkan, Tempat Meminta"));
      dataList.add(AsmaModel("69", "القادر", "Al Qaadir",
          "Allah Yang Maha Menentukan, Maha Menyeimbangkan"));
      dataList.add(AsmaModel(
          "70", "المقتدر", "Al Muqtadir", "Allah Yang Maha Berkuasa"));
      dataList.add(AsmaModel(
          "71", "المقدم", "Al Muqaddim", "Allah Yang Maha Mendahulukan"));
      dataList.add(AsmaModel(
          "72", "المؤخر", "Al Mu`akkhir", "Allah Yang Maha Mengakhirkan"));
      dataList
          .add(AsmaModel("73", "الأول", "Al Awwal", "Allah Yang Maha Awal"));
      dataList
          .add(AsmaModel("74", "الأخر", "Al Aakhir", "Allah Yang Maha Akhir"));
      dataList.add(
          AsmaModel("75", "الظاهر", "Az Zhaahir", "Allah Yang Maha Nyata"));
      dataList.add(
          AsmaModel("76", "الباطن", "Al Baathin", "Allah Yang Maha Ghaib"));
      dataList.add(
          AsmaModel("77", "الوالي", "Al Waali", "Allah Yang Maha Memerintah"));
      dataList.add(AsmaModel(
          "78", "المتعالي", "Al Muta`aalii", "Allah Yang Maha Tinggi"));
      dataList.add(AsmaModel("79", "البر", "Al Barru",
          "Allah Yang Maha Penderma (Maha Pemberi Kebajikan)"));
      dataList.add(AsmaModel(
          "80", "التواب", "At Tawwaab", "Allah Yang Maha Penerima Tobat"));
      dataList.add(AsmaModel(
          "81", "المنتقم", "Al Muntaqim", "Allah Yang Maha Pemberi Balasan"));
      dataList
          .add(AsmaModel("82", "العفو", "Al Afuww", "Allah Yang Maha Pemaaf"));
      dataList.add(
          AsmaModel("83", "الرؤوف", "Ar Ra`uuf", "Allah Yang Maha Pengasuh"));
      dataList.add(AsmaModel("84", "مالك الملك", "Malikul Mulk",
          "Allah Yang Maha Penguasa Kerajaan (Semesta)"));
      dataList.add(AsmaModel(
          "85",
          "ذو الجلال و الإكرام",
          "Dzul Jalaali Wal Ikraam",
          "Allah Yang Maha Pemilik Kebesaran dan Kemuliaan"));
      dataList.add(AsmaModel(
          "86", "المقسط", "Al Muqsith", "Allah Yang Maha Pemberi Keadilan"));
      dataList.add(AsmaModel(
          "87", "الجامع", "Al Jamii`", "Allah Yang Maha Mengumpulkan"));
      dataList
          .add(AsmaModel("88", "الغنى", "Al Ghaniyy", "Allah Yang Maha Kaya"));
      dataList.add(AsmaModel(
          "89", "المغنى", "Al Mughnii", "Allah Yang Maha Pemberi Kekayaan"));
      dataList.add(
          AsmaModel("90", "المانع", "Al Maani", "Allah Yang Maha Mencegah"));
      dataList.add(AsmaModel(
          "91", "الضار", "Ad Dhaar", "Allah Yang Maha Penimpa Kemudharatan"));
      dataList.add(AsmaModel(
          "92", "النافع", "An Nafii`", "Allah Yang Maha Memberi Manfaat"));
      dataList.add(AsmaModel("93", "النور", "An Nuur",
          "Allah Yang Maha Bercahaya (Menerangi, Memberi Cahaya)"));
      dataList.add(AsmaModel(
          "94", "الهادئ", "Al Haadii", "Allah Yang Maha Pemberi Petunjuk"));
      dataList.add(AsmaModel("95", "البديع", "Al Badii’",
          "Allah Yang Maha Pencipta Yang Tiada Bandingannya"));
      dataList
          .add(AsmaModel("96", "الباقي", "Al Baaqii", "Allah Yang Maha Kekal"));
      dataList.add(
          AsmaModel("97", "الوارث", "Al Waarits", "Allah Yang Maha Pewaris"));
      dataList.add(
          AsmaModel("98", "الرشيد", "Ar Rasyiid", "Allah Yang Maha Pandai"));
      dataList.add(
          AsmaModel("99", "الصبور", "As Shabuur", "Allah Yang Maha Sabar"));
    });
  }

  @override
  void initState() {
    _getAsmaInformation();
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
            "Asma Al-Husna",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          dataList[index].no == ""
                              ? "${dataList[index].no!} "
                              : "${dataList[index].no!}.",
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
                                dataList[index].bacaan!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: themeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                dataList[index].arti!,
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
                      dataList[index].ayat!,
                      style: TextStyle(
                          fontSize: 20,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : textColor,
                          fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
