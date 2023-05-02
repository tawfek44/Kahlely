// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithModel _$HadithModelFromJson(Map<String, dynamic> json) => HadithModel(
      hadithTellerName: json['name'] as String,
      hadithTellerSlug: json['slug'] as String,
      hadithTellerTotalHadithNumber: json['total'] as int,
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      hadithInfo: (json['items'] as List<dynamic>)
          .map((e) => HadithDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HadithModelToJson(HadithModel instance) =>
    <String, dynamic>{
      'name': instance.hadithTellerName,
      'slug': instance.hadithTellerSlug,
      'total': instance.hadithTellerTotalHadithNumber,
      'pagination': instance.pagination,
      'items': instance.hadithInfo,
    };

HadithDataModel _$HadithDataModelFromJson(Map<String, dynamic> json) =>
    HadithDataModel(
      number: json['number'] as int,
      hadithText: json['arab'] as String,
    );

Map<String, dynamic> _$HadithDataModelToJson(HadithDataModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'arab': instance.hadithText,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
    };
