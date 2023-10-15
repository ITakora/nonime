import 'dart:convert';

import 'package:nonime/network/models/video_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoApi {
  Future<List<VideoModel>> getVideoApi({required String watchUrl}) async {
    final Uri url = Uri.parse(
        'https://anime-indo-rest-api.vercel.app/luckyanime/watch$watchUrl');
    final response = await http.get(url);
    final List data =
        (jsonDecode(response.body) as Map<String, dynamic>)['episodeUrl'];

    final List<VideoModel> videoAnime =
        data.map((data) => VideoModel.fromJson(data)).toList();
    return videoAnime;
  }
}

final videoAnime = Provider<VideoApi>((ref) => VideoApi());
