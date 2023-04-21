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
import 'package:khalely/bloc/azkar_cubit/azkar_cubit.dart' as _i8;
import 'package:khalely/bloc/hadith_cubit/hadith_tellers_cubit.dart' as _i13;
import 'package:khalely/bloc/prayer_timinigs_cubit/prayer_timinigs_cubit.dart'
    as _i10;
import 'package:khalely/bloc/quran_surah_names_cubit/quran_surah_names_cubit.dart'
    as _i11;
import 'package:khalely/bloc/surah_translation_cubit/surah_translation_cubit.dart'
    as _i12;
import 'package:khalely/data/api/app_api_handler.dart' as _i3;
import 'package:khalely/data/repositories/azkarRepository.dart' as _i4;
import 'package:khalely/data/repositories/hadith_teller_repository.dart' as _i9;
import 'package:khalely/data/repositories/prayer_timinigs_repository.dart'
    as _i5;
import 'package:khalely/data/repositories/quran_surah_names_repositories.dart'
    as _i6;
import 'package:khalely/data/repositories/surah_translation_repository.dart'
    as _i7;
import 'package:khalely/di/modules/app_module.dart' as _i14;

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
    gh.singleton<_i4.AzkarRepository>(
        _i4.AzkarRepository.create(gh<_i3.AzkarApiHandler>()));
    await gh.singletonAsync<_i3.HadithTellersApiHandler>(
      () => _i3.HadithTellersApiHandler.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.PrayerTimingsApiHandler>(
      () => _i3.PrayerTimingsApiHandler.create(),
      preResolve: true,
    );
    gh.singleton<_i5.PrayerTimingsRepository>(
        _i5.PrayerTimingsRepository.create(gh<_i3.PrayerTimingsApiHandler>()));
    await gh.singletonAsync<_i3.QuranKareemSurahNamesApiHandler>(
      () => _i3.QuranKareemSurahNamesApiHandler.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.QuranKareemTranslationApiHandler>(
      () => _i3.QuranKareemTranslationApiHandler.create(),
      preResolve: true,
    );
    gh.singleton<_i6.QuranSurahNamesRepository>(
        _i6.QuranSurahNamesRepository.create(
            gh<_i3.QuranKareemSurahNamesApiHandler>()));
    gh.singleton<_i7.SurahTranslationRepository>(
        _i7.SurahTranslationRepository.create(
            gh<_i3.QuranKareemTranslationApiHandler>()));
    gh.factory<bool>(
      () => appModule.darkModeEnabled,
      instanceName: 'dark_mode',
    );
    gh.factory<_i8.AzkarCubit>(() => _i8.AzkarCubit(gh<_i4.AzkarRepository>()));
    gh.singleton<_i9.HadithTellerRepository>(
        _i9.HadithTellerRepository.create(gh<_i3.HadithTellersApiHandler>()));
    gh.factory<_i10.PrayerTimingsCubit>(
        () => _i10.PrayerTimingsCubit(gh<_i5.PrayerTimingsRepository>()));
    gh.factory<_i11.QuranSurahNamesCubit>(
        () => _i11.QuranSurahNamesCubit(gh<_i6.QuranSurahNamesRepository>()));
    gh.factory<_i12.SurahTranslationCubit>(
        () => _i12.SurahTranslationCubit(gh<_i7.SurahTranslationRepository>()));
    gh.factory<_i13.HadithTellerNamesCubit>(
        () => _i13.HadithTellerNamesCubit(gh<_i9.HadithTellerRepository>()));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
