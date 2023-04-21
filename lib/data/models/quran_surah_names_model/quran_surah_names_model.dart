import 'package:freezed_annotation/freezed_annotation.dart';
part 'quran_surah_names_model.g.dart';
@JsonSerializable()
class QuranSurahNamesModel {
  @JsonKey(name: 'data')
  List<QuranSurahNamesData> quranSurahNamesData;

  QuranSurahNamesModel({required this.quranSurahNamesData});

  factory QuranSurahNamesModel.fromJson(final Map<String, dynamic> json) {
    return _$QuranSurahNamesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranSurahNamesModelToJson(this);
}
@JsonSerializable()
class QuranSurahNamesData {
  @JsonKey(name: 'number')
  int number;
  @JsonKey(name: 'name')
  String surahName;
  @JsonKey(name: 'englishName')
  String surahEnglishName;
  @JsonKey(name: 'englishNameTranslation')
  String englishNameTranslation;
  @JsonKey(name: 'numberOfAyahs')
  int numberOfAyahs;
  @JsonKey(name: 'revelationType')
  String revelationType;

  QuranSurahNamesData({required this.number, required this.surahName,required this.surahEnglishName,
    required this.englishNameTranslation,required this.numberOfAyahs,required this.revelationType});
  factory QuranSurahNamesData.fromJson(final Map<String, dynamic> json) {
    return _$QuranSurahNamesDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranSurahNamesDataToJson(this);
}