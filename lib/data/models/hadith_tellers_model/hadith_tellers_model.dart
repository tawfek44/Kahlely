import 'package:freezed_annotation/freezed_annotation.dart';

part 'hadith_tellers_model.g.dart';
@JsonSerializable()
class HadithTellerModel {
  @JsonKey(name: 'name')
  String hadithTellerName;
  @JsonKey(name: 'slug')
  String hadithTellerSlug ;
  @JsonKey(name: 'total')
  int hadithTellerTotalHadithNumber;


  HadithTellerModel({required this.hadithTellerName,required this.hadithTellerSlug,
     required this.hadithTellerTotalHadithNumber});

  factory HadithTellerModel.fromJson(final Map<String, dynamic> json) {
    return _$HadithTellerModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HadithTellerModelToJson(this);
}