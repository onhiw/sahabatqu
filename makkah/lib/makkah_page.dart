import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MakkahPage extends StatefulWidget {
  const MakkahPage({super.key});

  @override
  State<MakkahPage> createState() => _MakkahPageState();
}

class _MakkahPageState extends State<MakkahPage> {
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(
              'https://www.youtube.com/watch?v=HU65fWdHiMI')
          .toString(),
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        strictRelatedVideos: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _youtubeController!.close();
    super.dispose();
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
            "Makkah Live",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: YoutubeValueBuilder(
            controller: _youtubeController!,
            builder: (context, value) {
              return YoutubePlayer(
                controller: _youtubeController!,
                aspectRatio: 16 / 9,
                backgroundColor: Theme.of(context).colorScheme.background,
              );
            }),
      ),
    );
  }
}
