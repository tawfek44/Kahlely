// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:khalely/data/api/app_api_handler.dart' as _i3;
import 'package:khalely/data/repositories/prayer_timinigs_repository.dart'
    as _i4;
import 'package:khalely/di/modules/app_module.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.singletonAsync<_i3.AzkarApiHandler>(
      () => _i3.AzkarApiHandler.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.HadithTellersApiHandler>(
      () => _i3.HadithTellersApiHandler.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.PrayerTimingsApiHandler>(
      () => _i3.PrayerTimingsApiHandler.create(),
      preResolve: true,
    );
    gh.singleton<_i4.PrayerTimingsRepository>(
        _i4.PrayerTimingsRepository.create(gh<_i3.PrayerTimingsApiHandler>()));
    await gh.singletonAsync<_i3.QuranKareemSurahNamesApiHandler>(
      () => _i3.QuranKareemSurahNamesApiHandler.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.QuranKareemTranslationApiHandler>(
      () => _i3.QuranKareemTranslationApiHandler.create(),
      preResolve: true,
    );
    gh.factory<bool>(
      () => appModule.darkModeEnabled,
      instanceName: 'dark_mode',
    );
    return this;
  }
}

class _$AppModule extends _i5.AppModule {}
