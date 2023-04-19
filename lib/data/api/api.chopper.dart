// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> getPrayerTimings(
    String date,
    String city,
    String country,
  ) {
    final Uri $url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/${date}?city=${city}&country=${country}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getQuranKareemSurahNames() {
    final Uri $url = Uri.parse('https://api.alquran.cloud/v1/surah');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getQuranKareemTranslation(int ayaID) {
    final Uri $url = Uri.parse(
        'https://quranenc.com/api/v1/translation/sura/arabic_moyassar/${ayaID}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHadithTellers() {
    final Uri $url = Uri.parse('https://hadis-api-id.vercel.app/hadith');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAzkar(int id) {
    final Uri $url = Uri.parse('https://www.hisnmuslim.com/api/ar/${id}.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
