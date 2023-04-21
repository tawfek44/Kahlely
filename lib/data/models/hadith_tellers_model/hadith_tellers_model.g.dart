// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_tellers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithTellerModel _$HadithTellerModelFromJson(Map<String, dynamic> json) =>
    HadithTellerModel(
      hadithTellerName: json['name'] as String,
      hadithTellerSlug: json['slug'] as String,
      hadithTellerTotalHadithNumber: json['total'] as int,
    );

Map<String, dynamic> _$HadithTellerModelToJson(HadithTellerModel instance) =>
    <String, dynamic>{
      'name': instance.hadithTellerName,
      'slug': instance.hadithTellerSlug,
      'total': instance.hadithTellerTotalHadithNumber,
    };
