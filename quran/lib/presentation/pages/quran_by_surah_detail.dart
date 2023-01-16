import 'package:core/core.dart';
import 'package:core/domain/entities/quran/ayah.dart';
import 'package:core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/presentation/bloc/surah-detail-bloc/surah_detail_bloc.dart';

class QuranBySurahDetail extends StatefulWidget {
  final String nomor;
  final String nama;
  const QuranBySurahDetail(
      {super.key, required this.nomor, required this.nama});

  @override
  State<QuranBySurahDetail> createState() => _QuranBySurahDetailState();
}

class _QuranBySurahDetailState extends State<QuranBySurahDetail> {
  final ScrollController _scrollController = ScrollController();
  int _limit = 0;
  int _firstCount = 1;
  int _lastCount = 10;

  @override
  void initState() {
    Future.microtask(() {
      context
          .read<SurahDetailBloc>()
          .add(GetSurahDetail(widget.nomor, _firstCount, _lastCount));
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_lastCount < _limit) {
          setState(() {
            _firstCount = _firstCount + 10;
            _lastCount = _lastCount + 10;
          });
          Future.microtask(() {
            context
                .read<SurahDetailBloc>()
                .add(GetSurahDetail(widget.nomor, _firstCount, _lastCount));
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        iconTheme: IconThemeData(
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor),
        title: Text(
          widget.nama,
          style: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
          builder: (context, state) {
        if (state is SurahDetailLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is SurahDetailLoaded) {
          if (int.parse(state.ayahResponseA.surah.ayat) < 10) {
            _lastCount = int.parse(state.ayahResponseA.surah.ayat);
          }
          _limit = int.parse(state.ayahResponseA.surah.ayat);
          return _buildList(context, state.ar, state.id);
        } else if (state is SurahDetailError) {
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

  Widget _buildList(BuildContext context, List<Ayah> ar, List<Ayah> id) {
    final ThemeData theme = Theme.of(context);
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        widget.nomor == "1"
            ? Container()
            : Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: const Text(
                    "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
              ),
        widget.nomor == "1"
            ? Container()
            : const SizedBox(
                height: 16,
              ),
        ...ar
            .asMap()
            .map((i, value) => MapEntry(
                i,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.nomor == "1"
                          ? value.teks
                          : value.teks.replaceAll(
                              "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ", ""),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "${i + 1}.",
                    //         style: TextStyle(
                    //             color: theme.brightness == Brightness.dark
                    //                 ? Colors.white
                    //                 : textColor,
                    //             fontSize: 16),
                    //       ),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       Expanded(
                    //         child: Html(
                    //             data: ayahResponseA
                    //                 .ayahResponseE.ayahData.idt[i].teks),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${i + 1}.",
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : textColor,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              id[i].teks,
                              style: TextStyle(
                                  color: theme.brightness == Brightness.dark
                                      ? Colors.white
                                      : textColor,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )))
            .values
            .toList()
      ],
    );
  }
}
