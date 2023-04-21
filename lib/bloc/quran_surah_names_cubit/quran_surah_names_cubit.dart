import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:khalely/data/repositories/hadith_teller_repository.dart';
import 'package:khalely/data/repositories/prayer_timinigs_repository.dart';
import 'package:khalely/data/repositories/quran_surah_names_repositories.dart';

import '../../data/models/azkar_model/azkar_model.dart';
import '../../data/models/prayer_timings_model/prayer_timings_model.dart';
import '../../data/models/quran_surah_names_model/quran_surah_names_model.dart';
import '../../data/repositories/azkarRepository.dart';

part 'quran_surah_names_state.dart';
part 'quran_surah_names_cubit.freezed.dart';

@injectable
class QuranSurahNamesCubit extends Cubit<QuranSurahNamesState> {
  QuranSurahNamesCubit(this._quranSurahNamesRepository)
      : super(const QuranSurahNamesState.initial());

  final QuranSurahNamesRepository _quranSurahNamesRepository;

  Future<void> getQuranSurahNames() async {
    try {
      emit(const QuranSurahNamesState.loading());
      final quranSurahNamesModel = await _quranSurahNamesRepository.getQuranSurahNames();
      emit(QuranSurahNamesState.loaded(quranSurahNamesModel));
    } catch (e) {
      emit(QuranSurahNamesState.error(e));
    }
  }


}
