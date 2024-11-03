import 'package:flutter/material.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatefulWidget {
  String videoId;
  VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
      ),
    );
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              aspectRatio: 16 / 9,
              progressIndicatorColor: colorPrimary,
              progressColors: ProgressBarColors(
                playedColor: colorPrimary,
                handleColor: colorPrimary,
              ),
            ),
          ),
        ),
      );
    });
  }
}
