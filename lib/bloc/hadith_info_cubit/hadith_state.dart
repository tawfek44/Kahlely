part of 'hadith_cubit.dart';

@freezed
class HadithState with _$HadithState {
  const factory HadithState.initial() = _Initial;
  const factory HadithState.loading() = LoadingHadith;
  const factory HadithState.loadingMore() = LoadingMoreHadith;
  const factory HadithState.loaded(HadithModel hadithDataInfo) = LoadedHadith;
  const factory HadithState.error(Object e) = ErrorHadith;
}
