import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkar_model.g.dart';
@JsonSerializable()
class AzkarModel {
  @JsonKey(name: 'أذكار الصباح والمساء')
  List<MorningAndNightAzkar> morningAndNightAzkar;

  AzkarModel({required this.morningAndNightAzkar});

  factory AzkarModel.fromJson(final Map<String, dynamic> json) {
    return _$AzkarModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AzkarModelToJson(this);
}
@JsonSerializable()
class MorningAndNightAzkar {
  @JsonKey(name: 'ID')
  int id;
  @JsonKey(name: 'ARABIC_TEXT')
  String azkarText ;
  @JsonKey(name: 'REPEAT')
  int repeatCount;
  @JsonKey(name: 'AUDIO')
  Uri azkarAudio;


  MorningAndNightAzkar({required this.id,required this.azkarText,required this.repeatCount,required this.azkarAudio});

  factory MorningAndNightAzkar.fromJson(final Map<String, dynamic> json) {
    return _$MorningAndNightAzkarFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MorningAndNightAzkarToJson(this);
}