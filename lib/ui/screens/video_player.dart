import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/models/arguments_models.dart';
import 'package:nonime/network/models/video_models.dart';
import 'package:nonime/riverpod/video_riverpod.dart';
import 'package:nonime/ui/colors/colors.dart';
import 'package:nonime/ui/widgets/video_widget.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({super.key, required this.episodeUrl});

  final String episodeUrl;

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(videoRiverpod(widget.episodeUrl));
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('episode'),
        ),
        body: data.when(
          error: (error, stackTrace) => Text(
            error.toString(),
            style: TextStyle(color: Colors.white),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) {
            return VideoWidget();
          },
        ));
  }
}
