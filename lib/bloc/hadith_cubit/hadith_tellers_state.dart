part of 'hadith_tellers_cubit.dart';

@freezed
class HadithTellersState with _$HadithTellersState {
  const factory HadithTellersState.initial() = _Initial;
  const factory HadithTellersState.loading() = LoadingHadithTellerNames;
  const factory HadithTellersState.loaded(List<HadithTellerModel> hadithTellerNames) = LoadedHadithTellerNames;
  const factory HadithTellersState.error(Object e) = ErrorHadithTellerNames;



}