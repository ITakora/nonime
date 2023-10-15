import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/api/detail_api.dart';
import 'package:nonime/network/models/detail_models.dart';

final detailRiverpod = FutureProvider.family<List<DetailModel>, String>(
    (ref, urlDetail) =>
        ref.watch(detailAnime).getDetailApi(urlDetail: urlDetail));
