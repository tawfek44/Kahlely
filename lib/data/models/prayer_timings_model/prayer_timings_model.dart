import 'package:freezed_annotation/freezed_annotation.dart';
part 'prayer_timings_model.g.dart';
@JsonSerializable()
class PlayerTimingsModel{
  @JsonKey(name: 'data')
  PlayerTimingsDataModel playerTimingsDataModel;

  PlayerTimingsModel({required this.playerTimingsDataModel});

  factory PlayerTimingsModel.fromJson(final Map<String, dynamic> json) {
    return _$PlayerTimingsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlayerTimingsModelToJson(this);
}
@JsonSerializable()
class PlayerTimingsDataModel{
  @JsonKey(name: 'timings')
  PlayerTimingsModelData timings;

   @JsonKey(name: 'date')
   PlayerTimingsModelDate date;

  PlayerTimingsDataModel({required this.timings,required this.date});
  factory PlayerTimingsDataModel.fromJson(final Map<String, dynamic> json) {
    return _$PlayerTimingsDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlayerTimingsDataModelToJson(this);
}
@JsonSerializable()
class PlayerTimingsModelData{
  @JsonKey(name: 'Fajr')
  String fajr;
  @JsonKey(name: 'Sunrise')
  String sunrise;
  @JsonKey(name: 'Dhuhr')
  String dhuhr;
  @JsonKey(name: 'Asr')
  String asr;
  @JsonKey(name: 'Sunset')
  String sunset;
  @JsonKey(name: 'Maghrib')
  String maghrib;
  @JsonKey(name: 'Isha')
  String isha;
  @JsonKey(name: 'Imsak')
  String imsak;
  @JsonKey(name: 'Midnight')
  String midNight;
  @JsonKey(name: 'Firstthird')
  String firstThird;
  @JsonKey(name: 'Lastthird')
  String lastThird;

  PlayerTimingsModelData({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midNight,
    required this.firstThird,
    required this.lastThird
  }
  );
  factory PlayerTimingsModelData.fromJson(final Map<String, dynamic> json) {
    return _$PlayerTimingsModelDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlayerTimingsModelDataToJson(this);
}

@JsonSerializable()
class PlayerTimingsModelDate{

   @JsonKey(name: 'readable')
   String readableCurrentDate;

  @JsonKey(name: 'hijri')
  Hijri hijriDate;

  @JsonKey(name: 'gregorian')
  Gregorian gregorianDate;

   PlayerTimingsModelDate({required this.readableCurrentDate,required this.hijriDate,required this.gregorianDate});
   factory PlayerTimingsModelDate.fromJson(final Map<String, dynamic> json) {
     return _$PlayerTimingsModelDateFromJson(json);
   }

   Map<String, dynamic> toJson() => _$PlayerTimingsModelDateToJson(this);
}

@JsonSerializable()
class Hijri {
  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'day')
  String day;

  @JsonKey(name: 'weekday')
  WeekDay weekDay;

  @JsonKey(name: 'month')
  Month month;

  @JsonKey(name: 'year')
  String year;

  Hijri({required this.date,required this.day,required this.weekDay,required this.month,required this.year});

  factory Hijri.fromJson(final Map<String, dynamic> json) {
    return _$HijriFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HijriToJson(this);
}

@JsonSerializable()
class WeekDay{
  @JsonKey(name: 'ar')
  String dayInArabic;
  @JsonKey(name: 'en')
  String dayInEnglish;

  WeekDay({required this.dayInArabic,required this.dayInEnglish});

  factory WeekDay.fromJson(final Map<String, dynamic> json) {
    return _$WeekDayFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeekDayToJson(this);
}


@JsonSerializable()
class Month{
  @JsonKey(name: 'number')
  int number;
  @JsonKey(name: 'ar')
  String dayInArabic;
  @JsonKey(name: 'en')
  String dayInEnglish;

  Month({required this.dayInArabic,required this.dayInEnglish,required this.number});

  factory Month.fromJson(final Map<String, dynamic> json) {
    return _$MonthFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}





@JsonSerializable()
class Gregorian {
  @JsonKey(name: 'date')
  String gregorianDate;

  @JsonKey(name: 'day')
  String gregorianDay;

  @JsonKey(name: 'weekday')
  GregorianWeekDay gregorianWeekDay;

  @JsonKey(name: 'month')
  GregorianMonth gregorianMonth;

  @JsonKey(name: 'year')
  String gregorianYear;


  Gregorian({required this.gregorianDate,required this.gregorianDay,required this.gregorianWeekDay,required this.gregorianMonth,
    required this.gregorianYear});

  factory Gregorian.fromJson(final Map<String, dynamic> json) {
    return _$GregorianFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GregorianToJson(this);
}


@JsonSerializable()
class GregorianWeekDay{
  @JsonKey(name: 'en')
  String dayInEnglish;

  GregorianWeekDay({required this.dayInEnglish});

  factory GregorianWeekDay.fromJson(final Map<String, dynamic> json) {
    return _$GregorianWeekDayFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GregorianWeekDayToJson(this);
}


@JsonSerializable()
class GregorianMonth{
  @JsonKey(name: 'number')
  int number;
  @JsonKey(name: 'en')
  String dayInEnglish;

  GregorianMonth({required this.dayInEnglish,required this.number});

  factory GregorianMonth.fromJson(final Map<String, dynamic> json) {
    return _$GregorianMonthFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GregorianMonthToJson(this);
}