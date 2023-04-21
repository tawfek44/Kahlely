import 'package:injectable/injectable.dart';

import '../api/app_api_handler.dart';
import '../models/prayer_timings_model/prayer_timings_model.dart';
import '../models/surah_translation_model/surah_translation_model.dart';

@singleton
@injectable
class SurahTranslationRepository {
  SurahTranslationRepository._(
      this._api,
      );

  final QuranKareemTranslationApiHandler _api;

  @factoryMethod
  factory SurahTranslationRepository.create(
      QuranKareemTranslationApiHandler api,
      ) {
    return SurahTranslationRepository._(api);
  }

  Future<SurahTranslationModel> getSurahTranslation({required int surahID}) async {
    final response = await _api.getQuranKareemTranslation(surahID);
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return SurahTranslationModel.fromJson(body);
  }
}
