
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalely/bloc/azkar_cubit/azkar_cubit.dart';
import 'package:khalely/bloc/hadith_cubit/hadith_tellers_cubit.dart';
import 'package:khalely/bloc/prayer_timinigs_cubit/prayer_timinigs_cubit.dart';
import 'package:khalely/bloc/quran_surah_names_cubit/quran_surah_names_cubit.dart';
import 'package:khalely/bloc/surah_translation_cubit/surah_translation_cubit.dart';

import 'injection.dart';

MultiBlocProvider provideApp(Widget child) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AzkarCubit>()),
        BlocProvider(create: (_) => getIt<HadithTellerNamesCubit>()),
        BlocProvider(create: (_) => getIt<PrayerTimingsCubit>()),
        BlocProvider(create: (_) => getIt<QuranSurahNamesCubit>()),
        BlocProvider(create: (_) => getIt<SurahTranslationCubit>()),
      ],
      child: child,
    );
