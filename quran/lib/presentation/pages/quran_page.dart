import 'package:core/core.dart';
import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/presentation/bloc/surah-bloc/surah_bloc.dart';
import 'package:quran/presentation/pages/quran_by_surah_detail.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final searchName = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      context.read<SurahBloc>().add(FetchAllSurah());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
        title: Text(
          "Al-Quran",
          style: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      body: BlocBuilder<SurahBloc, SurahState>(builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is SurahLoaded) {
          return _buildList(context, state.surah);
        } else if (state is SurahError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(state.message),
          ));
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _buildList(BuildContext context, List<Surah> surah) {
    final ThemeData theme = Theme.of(context);

    final surahFilter = surah
        .where(
            (element) => element.nameId.toLowerCase().contains(searchName.text))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            cursorColor:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
            controller: searchName,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontSize: 14),
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 14, top: 14),
              filled: true,
              fillColor: theme.brightness == Brightness.dark
                  ? appBarDarkColor
                  : Colors.grey[300],
              hintText: 'Cari...',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: surahFilter.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, detailSurahRoute,
                      arguments: QuranBySurahDetail(
                        nomor: surahFilter[index].number,
                        nama: surahFilter[index].nameId,
                        type: surahFilter[index].revelation,
                      ));
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
                              surahFilter[index].number,
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
                                    surahFilter[index].nameId,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: themeColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${surahFilter[index].translationId} (${surahFilter[index].numberOfVerses})",
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
                          surahFilter[index].nameShort,
                          style: GoogleFonts.notoSansArabic(
                              fontSize: 16,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : textColor,
                              fontWeight: FontWeight.w600),
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
        ),
      ],
    );
  }
}
