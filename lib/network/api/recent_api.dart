import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/models/recent_models.dart';
import 'package:http/http.dart' as http;

class RecentApi {
  Future<List<RecentModel>> getRecentApi() async {
    final Uri url =
        Uri.parse("https://anime-indo-rest-api.vercel.app/luckyanime/recent");

    final response = await http.get(url);
    final List data =
        (jsonDecode(response.body) as Map<String, dynamic>)['data'];

    final List<RecentModel> recentAnime =
        data.map((data) => RecentModel.fromJson(data)).toList();

    return recentAnime;
  }
}

final recentAnime = Provider<RecentApi>((ref) => RecentApi());
