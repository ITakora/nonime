import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/api/recent_api.dart';
import 'package:nonime/network/models/recent_models.dart';

final recentRiverpod = FutureProvider<List<RecentModel>>(
    (ref) => ref.watch(recentAnime).getRecentApi());
