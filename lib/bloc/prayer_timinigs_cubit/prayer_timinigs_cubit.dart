import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:khalely/data/repositories/hadith_teller_repository.dart';
import 'package:khalely/data/repositories/prayer_timinigs_repository.dart';

import '../../data/models/azkar_model/azkar_model.dart';
import '../../data/models/prayer_timings_model/prayer_timings_model.dart';
import '../../data/repositories/azkarRepository.dart';

part 'prayer_timinigs_state.dart';
part 'prayer_timinigs_cubit.freezed.dart';

@injectable
class PrayerTimingsCubit extends Cubit<PrayerTimingsState> {
  PrayerTimingsCubit(this._prayerTimingsRepository)
      : super(const PrayerTimingsState.initial());

  final PrayerTimingsRepository _prayerTimingsRepository;

  Future<void> getPrayerTimings({
     required String date,
    required String city,
    required String country
}) async {
    try {
      emit(const PrayerTimingsState.loading());
      final prayerTimings = await _prayerTimingsRepository.getPlayerTimings(date: date, city: city, country: country);
      emit(PrayerTimingsState.loaded(prayerTimings));
    } catch (e) {
      emit(PrayerTimingsState.error(e));
    }
  }


}
