part of 'quran_surah_names_cubit.dart';

@freezed
class QuranSurahNamesState with _$QuranSurahNamesState {
  const factory QuranSurahNamesState.initial() = _Initial;
  const factory QuranSurahNamesState.loading() = LoadingQuranSurahNames;
  const factory QuranSurahNamesState.loaded(QuranSurahNamesModel quranSurahNamesModel) = LoadedQuranSurahNames;
  const factory QuranSurahNamesState.error(Object e) = ErrorQuranSurahNames;



}