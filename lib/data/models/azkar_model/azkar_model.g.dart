// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzkarModel _$AzkarModelFromJson(Map<String, dynamic> json) => AzkarModel(
      morningAndNightAzkar: (json['أذكار الصباح والمساء'] as List<dynamic>)
          .map((e) => MorningAndNightAzkar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AzkarModelToJson(AzkarModel instance) =>
    <String, dynamic>{
      'أذكار الصباح والمساء': instance.morningAndNightAzkar,
    };

MorningAndNightAzkar _$MorningAndNightAzkarFromJson(
        Map<String, dynamic> json) =>
    MorningAndNightAzkar(
      id: json['ID'] as int,
      azkarText: json['ARABIC_TEXT'] as String,
      repeatCount: json['REPEAT'] as int,
      azkarAudio: Uri.parse(json['AUDIO'] as String),
    );

Map<String, dynamic> _$MorningAndNightAzkarToJson(
        MorningAndNightAzkar instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ARABIC_TEXT': instance.azkarText,
      'REPEAT': instance.repeatCount,
      'AUDIO': instance.azkarAudio.toString(),
    };
