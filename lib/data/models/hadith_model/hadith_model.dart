import 'package:freezed_annotation/freezed_annotation.dart';

part 'hadith_model.g.dart';

@JsonSerializable()
class HadithModel {
  @JsonKey(name: 'name')
  String hadithTellerName;
  @JsonKey(name: 'slug')
  String hadithTellerSlug;
  @JsonKey(name: 'total')
  int hadithTellerTotalHadithNumber;

  @JsonKey(name: 'pagination')
  Pagination pagination;

  @JsonKey(name: 'items')
  List<HadithDataModel> hadithInfo;

  HadithModel(
      {required this.hadithTellerName,
      required this.hadithTellerSlug,
      required this.hadithTellerTotalHadithNumber,
      required this.pagination,
      required this.hadithInfo});

  factory HadithModel.fromJson(final Map<String, dynamic> json) {
    return _$HadithModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HadithModelToJson(this);
}

@JsonSerializable()
class HadithDataModel {
  @JsonKey(name: 'number')
  int number;
  @JsonKey(name: 'arab')
  String hadithText;

  HadithDataModel({required this.number, required this.hadithText});

  factory HadithDataModel.fromJson(final Map<String, dynamic> json) {
    return _$HadithDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HadithDataModelToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'totalPages')
  int totalPages;

  Pagination({required this.totalPages});

  factory Pagination.fromJson(final Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
