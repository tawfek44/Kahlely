part of 'azkar_cubit.dart';

@freezed
class AzkarState with _$AzkarState {
  const factory AzkarState.initial() = _Initial;
  const factory AzkarState.loading() = LoadingAzkar;
  const factory AzkarState.loaded(AzkarModel azkarModel) = LoadedAzkar;
  const factory AzkarState.error(Object e) = ErrorAzkar;

  const factory AzkarState.initialSleepAzkar() = _InitialSleepAzkar;
  const factory AzkarState.loadingSleepAzkar() = LoadingSleepAzkar;
  const factory AzkarState.loadedSleepAzkar(AzkarSleepModel azkarModel) =
      LoadedSleepAzkar;
  const factory AzkarState.errorSleepAzkar(Object e) = ErrorSleepAzkar;
}
