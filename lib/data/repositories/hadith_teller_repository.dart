import 'package:injectable/injectable.dart';

import '../api/app_api_handler.dart';
import '../models/hadith_tellers_model/hadith_tellers_model.dart';

@singleton
@injectable
class HadithTellerRepository {
  HadithTellerRepository._(
      this._api,
      );

  final HadithTellersApiHandler _api;

  @factoryMethod
  factory HadithTellerRepository.create(
      HadithTellersApiHandler api,
      ) {
    return HadithTellerRepository._(api);
  }

  Future<List<HadithTellerModel>> getHadithTellerNames() async {
    final response = await _api.getHadithTellers();
    if (!response.isSuccessful) {
      final error = response.error as Object;
      return Future.error(error);
    }
    final body = response.body as List;
    return body
        .cast<Map<String, dynamic>>()
        .map((e) => HadithTellerModel.fromJson(e))
        .toList();
  }

}
