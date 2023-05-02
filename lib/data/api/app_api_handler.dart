import 'dart:io';
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' show Client;
import 'package:khalely/data/models/hadith_model/hadith_model.dart';

import '../../constants.dart';
import 'api.dart';

class IgnoreCertHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

@singleton
@preResolve
class PrayerTimingsApiHandler {
  PrayerTimingsApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<PrayerTimingsApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(prayerTimingsApiRoot),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return PrayerTimingsApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getPrayerTimings(
      String date, String city, String country) async {
    return _api.getPrayerTimings(date, city, country);
  }
}

@singleton
@preResolve
class QuranKareemSurahNamesApiHandler {
  QuranKareemSurahNamesApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<QuranKareemSurahNamesApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(quranKareemSurahNamesApi),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return QuranKareemSurahNamesApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getQuranKareemSurahNames() async {
    return _api.getQuranKareemSurahNames();
  }
}

@singleton
@preResolve
class QuranKareemTranslationApiHandler {
  QuranKareemTranslationApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<QuranKareemTranslationApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(quranKareemTranslationApi),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return QuranKareemTranslationApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getQuranKareemTranslation(int surahID) async {
    return _api.getQuranKareemTranslation(surahID);
  }
}

@singleton
@preResolve
class HadithTellersApiHandler {
  HadithTellersApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<HadithTellersApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(hadithTellersApi),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return HadithTellersApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getHadithTellers() async {
    return _api.getHadithTellers();
  }
}

@singleton
@preResolve
class AzkarApiHandler {
  AzkarApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<AzkarApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(azkarApi),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return AzkarApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getAzkar(int id) async {
    return _api.getAzkar(id);
  }
}

@singleton
@preResolve
class HadithApiHandler {
  HadithApiHandler._(
    this._api,
  );
  @factoryMethod
  static Future<HadithApiHandler> create() async {
    HttpOverrides.global = IgnoreCertHttpOverride();
    final chopper = ChopperClient(
      baseUrl: Uri.parse(azkarApi),
      services: [ApiService.create()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      client: Client(),
    );
    return HadithApiHandler._(chopper.getService<ApiService>());
  }

  final ApiService _api;

  Future<Response> getHadithInfo(
      {required String name, required int page, required int limit}) async {
    return _api.getHadith(name, page, limit);
  }
}
