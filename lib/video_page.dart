import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class _VideoPlayerScreenState extends StatefulWidget {
  late VideoPlayerController _controller;

  void initPlayer() async {
    /// initialise player
  }

  void disposePlayer() {
    /// dispose player
  }

  void resetPlayer() {
    disposePlayer();
    initPlayer();
  }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void didUpdateWidget(VideoPlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.videoUrl != widget.videoUrl) {
      resetPlayer();
    }
  }

  @override
  void dispose() {
    disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
