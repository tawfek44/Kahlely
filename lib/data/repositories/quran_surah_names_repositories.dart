import 'package:injectable/injectable.dart';

import '../api/app_api_handler.dart';
import '../models/quran_surah_names_model/quran_surah_names_model.dart';

@singleton
@injectable
class QuranSurahNamesRepository {
  QuranSurahNamesRepository._(
      this._api,
      );

  final QuranKareemSurahNamesApiHandler _api;

  @factoryMethod
  factory QuranSurahNamesRepository.create(
      QuranKareemSurahNamesApiHandler api,
      ) {
    return QuranSurahNamesRepository._(api);
  }

  Future<QuranSurahNamesModel> getQuranSurahNames() async {
    final response = await _api.getQuranKareemSurahNames();
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return QuranSurahNamesModel.fromJson(body);
  }

}
