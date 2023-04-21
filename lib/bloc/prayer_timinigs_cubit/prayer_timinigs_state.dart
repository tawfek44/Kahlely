part of 'prayer_timinigs_cubit.dart';

@freezed
class PrayerTimingsState with _$PrayerTimingsState {
  const factory PrayerTimingsState.initial() = _Initial;
  const factory PrayerTimingsState.loading() = LoadingPrayerTimings;
  const factory PrayerTimingsState.loaded(PlayerTimingsModel playerTimingsModel) = LoadedPrayerTimings;
  const factory PrayerTimingsState.error(Object e) = ErrorPrayerTimings;



}