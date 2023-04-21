import 'package:freezed_annotation/freezed_annotation.dart';
part 'surah_translation_model.g.dart';
@JsonSerializable()
class SurahTranslationModel {
  @JsonKey(name: 'result')
  List<SurahTranslationDataModel> surahTranslationDataModel;

  SurahTranslationModel({required this.surahTranslationDataModel});

  factory SurahTranslationModel.fromJson(final Map<String, dynamic> json) {
    return _$SurahTranslationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SurahTranslationModelToJson(this);
}
@JsonSerializable()
class SurahTranslationDataModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'sura')
  String surahNumberInQuran;
  @JsonKey(name: 'aya')
  String ayaNumber;
  @JsonKey(name: 'arabic_text')
  String ayaInArabic;
  @JsonKey(name: 'translation')
  String ayaTranslationInArabic;

  SurahTranslationDataModel({required this.id,required this.surahNumberInQuran,required this.ayaNumber,
    required this.ayaInArabic,required this.ayaTranslationInArabic});

  factory SurahTranslationDataModel.fromJson(final Map<String, dynamic> json) {
    return _$SurahTranslationDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SurahTranslationDataModelToJson(this);
}