// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericApiError _$$_GenericApiErrorFromJson(Map<String, dynamic> json) =>
    _$_GenericApiError(
      status: json['status'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_GenericApiErrorToJson(_$_GenericApiError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
    };
