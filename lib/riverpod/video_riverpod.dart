import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/api/video_api.dart';

import 'package:nonime/network/models/video_models.dart';

final videoRiverpod = FutureProvider.family<List<VideoModel>, String>(
    (ref, episodeUrl) =>
        ref.watch(videoAnime).getVideoApi(watchUrl: episodeUrl));
