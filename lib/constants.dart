import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalely/shared_wigets/app_bar_widget.dart';

const appName = 'خليلى';
const appDepartmentsNames = [
  'القرآن الكريم',
  'القبلة',
  'أذكار الصباح والمساء',
  'الأحاديث',
  'مواقيت الصلاة',
  'أذكار النوم',
  'التفسير'
];
const appDepartmentsIcons = [
  'quran_icon.png',
  'qibla.png',
  'prayer.png',
  'muslim.png',
  'time.png',
  'dua.png',
  'quran_trans.png'
];
const prayerTimingsIcons = [
  'fajr.png',
  'duhur.png',
  'asr.png',
  'maghrib.png',
  'isha.png'
];
const prayerTimingsNames = [
  'صلاة الفجر',
  'صلاة الضهر',
  'صلاة العصر',
  'صلاة المغرب',
  'صلاة العشاء'
];

const prayerTimingsApiRoot = 'https://api.aladhan.com/v1/timingsByCity';
const quranKareemSurahNamesApi = 'https://api.alquran.cloud/v1/surah';
const quranKareemTranslationApi =
    'https://quranenc.com/api/v1/translation/sura/arabic_moyassar';
const hadithTellersApi = 'https://hadis-api-id.vercel.app/hadith';
const azkarApi = 'https://www.hisnmuslim.com/api/ar';

PreferredSize getAppBar({required String title, required bool isLeading}) =>
    PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: AppBarWidget(
        title: title,
        isLeading: isLeading,
      ),
    );
