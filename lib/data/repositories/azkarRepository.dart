import 'package:injectable/injectable.dart';
import 'package:khalely/data/models/azkar_model/azkar_model.dart';

import '../api/app_api_handler.dart';
import '../models/hadith_tellers_model/hadith_tellers_model.dart';

@singleton
@injectable
class AzkarRepository {
  AzkarRepository._(
    this._api,
  );

  final AzkarApiHandler _api;

  @factoryMethod
  factory AzkarRepository.create(
    AzkarApiHandler api,
  ) {
    return AzkarRepository._(api);
  }

  Future<AzkarModel> getAzkar({required int id}) async {
    final response = await _api.getAzkar(id);
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return AzkarModel.fromJson(body);
  }

  Future<AzkarSleepModel> getSleepAzkar({required int id}) async {
    final response = await _api.getAzkar(id);
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body;
    return AzkarSleepModel.fromJson(body);
  }
}
