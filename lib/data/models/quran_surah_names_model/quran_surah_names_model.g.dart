// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_surah_names_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranSurahNamesModel _$QuranSurahNamesModelFromJson(
        Map<String, dynamic> json) =>
    QuranSurahNamesModel(
      quranSurahNamesData: (json['data'] as List<dynamic>)
          .map((e) => QuranSurahNamesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuranSurahNamesModelToJson(
        QuranSurahNamesModel instance) =>
    <String, dynamic>{
      'data': instance.quranSurahNamesData,
    };

QuranSurahNamesData _$QuranSurahNamesDataFromJson(Map<String, dynamic> json) =>
    QuranSurahNamesData(
      number: json['number'] as int,
      surahName: json['name'] as String,
      surahEnglishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: json['numberOfAyahs'] as int,
      revelationType: json['revelationType'] as String,
    );

Map<String, dynamic> _$QuranSurahNamesDataToJson(
        QuranSurahNamesData instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.surahName,
      'englishName': instance.surahEnglishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
