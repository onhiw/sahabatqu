import 'package:core/core.dart';
import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/presentation/bloc/surah-bloc/surah_bloc.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: surah.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return DetailQuranPage(
            //       idNumber: surah[index].nomor,
            //       name: surah[index].nama,
            //       type: surah[index].type);
            // }));
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
                        "${index + 1}.",
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
                              surah[index].nama,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: themeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "${surah[index].arti} (${surah[index].ayat})",
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
                    surah[index].asma,
                    style: TextStyle(
                        fontSize: 20,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : textColor,
                        fontFamily: 'Poppins',
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
    );
  }
}
