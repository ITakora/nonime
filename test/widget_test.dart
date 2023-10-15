// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:nonime/network/models/detail_models.dart';
import 'package:nonime/network/models/recent_models.dart';
import 'package:nonime/network/models/video_models.dart';
import 'package:http/http.dart' as http;

void main() async {
  final Uri url = Uri.parse(
      'https://anime-indo-rest-api.vercel.app/luckyanime/watch/anime/1873/one-piece/episode/1');
  final response = await http.get(url);

  print(response.body);

  // final List data =
  //     (jsonDecode(response.body) as Map<String, dynamic>)['video'];

  // final List<VideoModel> videoAnime =
  //     data.map((data) => VideoModel.fromJson(data)).toList();
  // return videoAnime;
}
