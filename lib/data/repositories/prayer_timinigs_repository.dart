import 'package:injectable/injectable.dart';

import '../api/app_api_handler.dart';
import '../models/prayer_timings_model/prayer_timings_model.dart';

@singleton
@injectable
class PrayerTimingsRepository {
  PrayerTimingsRepository._(
      this._api,
      );

  final PrayerTimingsApiHandler _api;

  @factoryMethod
  factory PrayerTimingsRepository.create(
      PrayerTimingsApiHandler api,
      ) {
    return PrayerTimingsRepository._(api);
  }

 Future<PlayerTimingsModel> getPlayerTimings({required String date,required String city,required String country}) async {
    final response = await _api.getPrayerTimings(date, city, country);
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return PlayerTimingsModel.fromJson(body);
  }
}
