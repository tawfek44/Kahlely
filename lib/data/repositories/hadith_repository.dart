import 'package:injectable/injectable.dart';
import 'package:khalely/data/models/azkar_model/azkar_model.dart';
import 'package:khalely/data/models/hadith_model/hadith_model.dart';

import '../api/app_api_handler.dart';
import '../models/hadith_tellers_model/hadith_tellers_model.dart';

@singleton
@injectable
class HadithRepository {
  HadithRepository._(
    this._api,
  );

  final HadithApiHandler _api;

  @factoryMethod
  factory HadithRepository.create(
    HadithApiHandler api,
  ) {
    return HadithRepository._(api);
  }

  Future<HadithModel> getHadithInfo(
      {required String name, required int page, required int limit}) async {
    final response =
        await _api.getHadithInfo(name: name, page: page, limit: limit);
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return HadithModel.fromJson(body);
  }
}
