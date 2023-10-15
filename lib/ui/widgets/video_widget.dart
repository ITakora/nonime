// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  // late VideoPlayerController _videoController;
  // late ChewieController _chewieController;
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
            autoDispose: true,
            aspectRatio: 16 / 9,
            fit: BoxFit.contain,
            autoDetectFullscreenDeviceOrientation: true);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        'https://liscia.my.id/0:/KOI%20KISAMA/OSHIKO/1/MP4/Kuramanime-OSHIKO-01-720p-Doro.mp4',
        notificationConfiguration: const BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: "Elephant dream",
          author: "Some author",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/1200px-African_Bush_Elephant.jpg",
          activityName: "MainActivity",
        ));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
    // _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    // _chewieController = ChewieController(
    //   videoPlayerController: _videoController,
    //   aspectRatio: 16 / 9,
    //   allowFullScreen: true,
    // );
  }

  @override
  void dispose() {
    // _videoController.dispose();
    // _chewieController.dispose();
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(controller: _betterPlayerController));
  }
}
