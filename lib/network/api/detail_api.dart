import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/models/detail_models.dart';
import 'package:http/http.dart' as http;

class DetailAnimeApi {
  Future<List<DetailModel>> getDetailApi({required String urlDetail}) async {
    final Uri url = Uri.parse(
        'https://anime-indo-rest-api.vercel.app/luckyanime/details$urlDetail');
    final response = await http.get(url);
    final List data =
        (jsonDecode(response.body) as Map<String, dynamic>)['data'];

    final detailAnime =
        data.map((value) => DetailModel.fromJson(value)).toList();
    return detailAnime;
  }
}

final detailAnime = Provider<DetailAnimeApi>((ref) => DetailAnimeApi());
