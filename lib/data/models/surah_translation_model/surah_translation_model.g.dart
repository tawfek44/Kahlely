// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_translation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahTranslationModel _$SurahTranslationModelFromJson(
        Map<String, dynamic> json) =>
    SurahTranslationModel(
      surahTranslationDataModel: (json['result'] as List<dynamic>)
          .map((e) =>
              SurahTranslationDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahTranslationModelToJson(
        SurahTranslationModel instance) =>
    <String, dynamic>{
      'result': instance.surahTranslationDataModel,
    };

SurahTranslationDataModel _$SurahTranslationDataModelFromJson(
        Map<String, dynamic> json) =>
    SurahTranslationDataModel(
      id: json['id'] as String,
      surahNumberInQuran: json['sura'] as String,
      ayaNumber: json['aya'] as String,
      ayaInArabic: json['arabic_text'] as String,
      ayaTranslationInArabic: json['translation'] as String,
    );

Map<String, dynamic> _$SurahTranslationDataModelToJson(
        SurahTranslationDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sura': instance.surahNumberInQuran,
      'aya': instance.ayaNumber,
      'arabic_text': instance.ayaInArabic,
      'translation': instance.ayaTranslationInArabic,
    };
