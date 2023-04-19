// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
class GenericApiError with _$GenericApiError {
  factory GenericApiError({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'error') String? error,
    @JsonKey(name: 'message') String? message,
  }) = _GenericApiError;

  factory GenericApiError.fromJson(Map<String, dynamic> json) =>
      _$GenericApiErrorFromJson(json);
}

