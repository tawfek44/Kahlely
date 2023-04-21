part of 'surah_translation_cubit.dart';

@freezed
class SurahTranslationState with _$SurahTranslationState {
  const factory SurahTranslationState.initial() = _Initial;
  const factory SurahTranslationState.loading() = LoadingSurahTranslation;
  const factory SurahTranslationState.loaded(SurahTranslationModel surahTranslationModel) = LoadedSurahTranslation;
  const factory SurahTranslationState.error(Object e) = ErrorSurahTranslationState;



}