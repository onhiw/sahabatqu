import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoMekkahPage extends StatefulWidget {
  @override
  _VideoMekkahPageState createState() => _VideoMekkahPageState();
}

class _VideoMekkahPageState extends State<VideoMekkahPage> {
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "Ps24zIcVHs4",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: true,
      ),
    );
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.landscape) {
        return Scaffold(
          body: Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.pink,
              bottomActions: [
                const SizedBox(width: 14.0),
                CurrentPosition(),
                const SizedBox(width: 8.0),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.grey,
                      handleColor: Colors.pink,
                      playedColor: Colors.pink),
                ),
                const SizedBox(width: 8.0),
                RemainingDuration(),
                const PlaybackSpeedButton(),
                const SizedBox(width: 14.0),
              ],
              onReady: () {
                _controller.addListener(() {
                  return listener;
                });
              },
              progressColors: ProgressBarColors(
                playedColor: Colors.pink,
                handleColor: Colors.pink,
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
              ),
              // backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Makkah Live Stream",
                style: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : ColorPalette.textColor,
                    fontWeight: FontWeight.bold),
              )),
          body: Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.pink,
              bottomActions: [
                const SizedBox(width: 14.0),
                CurrentPosition(),
                const SizedBox(width: 8.0),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.grey,
                      handleColor: Colors.pink,
                      playedColor: Colors.pink),
                ),
                const SizedBox(width: 8.0),
                RemainingDuration(),
                const PlaybackSpeedButton(),
                const SizedBox(width: 14.0),
              ],
              onReady: () {
                _controller.addListener(() {
                  return listener;
                });
              },
              progressColors: ProgressBarColors(
                playedColor: Colors.pink,
                handleColor: Colors.pink,
              ),
            ),
          ),
        );
      }
    });
  }
}
