import 'package:chopper/chopper.dart';
import '../../constants.dart';
part 'api.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Get(path: '$prayerTimingsApiRoot/{date}?city={city}&country={country}')
  Future<Response> getPrayerTimings(
    @Path('date') String date,
    @Path('city') String city,
    @Path('country') String country,
  );

  @Get(path: quranKareemSurahNamesApi)
  Future<Response> getQuranKareemSurahNames();

  @Get(path: '$quranKareemTranslationApi/{id}')
  Future<Response> getQuranKareemTranslation(@Path('id') int surahID);

  @Get(path: hadithTellersApi)
  Future<Response> getHadithTellers();

  @Get(path: '$azkarApi/{id}.json')
  Future<Response> getAzkar(@Path('id') int id);

  @Get(path: '$hadithTellersApi/{name}?page={page}&limit={limit}')
  Future<Response> getHadith(
    @Path('name') String name,
    @Path('page') int page,
    @Path('limit') int limit,
  );
}
