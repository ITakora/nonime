// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:http/http.dart' as http;

void main() async {
  const int episode = 1;

  final Map<String, dynamic> queryParameters = {'anime-episode': '1'};

  final Uri url = Uri.parse("http://192.168.100.5:3001/Nanime/recent");
  // .replace(queryParameters: queryParameters);
  final response = await http.get(url);

  print(response.body);
}
