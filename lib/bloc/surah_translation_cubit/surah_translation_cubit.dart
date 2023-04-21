import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:khalely/data/repositories/hadith_teller_repository.dart';
import 'package:khalely/data/repositories/prayer_timinigs_repository.dart';
import 'package:khalely/data/repositories/quran_surah_names_repositories.dart';
import 'package:khalely/data/repositories/surah_translation_repository.dart';

import '../../data/models/azkar_model/azkar_model.dart';
import '../../data/models/prayer_timings_model/prayer_timings_model.dart';
import '../../data/models/quran_surah_names_model/quran_surah_names_model.dart';
import '../../data/models/surah_translation_model/surah_translation_model.dart';
import '../../data/repositories/azkarRepository.dart';

part 'surah_translation_state.dart';
part 'surah_translation_cubit.freezed.dart';

@injectable
class SurahTranslationCubit extends Cubit<SurahTranslationState> {
  SurahTranslationCubit(this._surahTranslationRepository)
      : super(const SurahTranslationState.initial());

  final SurahTranslationRepository _surahTranslationRepository;

  Future<void> getSurahTranslation({
  required int surahID
}) async {
    try {
      emit(const SurahTranslationState.loading());
      final surahTranslationModel = await _surahTranslationRepository.getSurahTranslation(surahID: surahID);
      emit(SurahTranslationState.loaded(surahTranslationModel));
    } catch (e) {
      emit(SurahTranslationState.error(e));
    }
  }


}
