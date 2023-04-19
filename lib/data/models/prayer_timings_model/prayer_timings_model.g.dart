// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerTimingsModel _$PlayerTimingsModelFromJson(Map<String, dynamic> json) =>
    PlayerTimingsModel(
      playerTimingsDataModel:
          PlayerTimingsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerTimingsModelToJson(PlayerTimingsModel instance) =>
    <String, dynamic>{
      'data': instance.playerTimingsDataModel,
    };

PlayerTimingsDataModel _$PlayerTimingsDataModelFromJson(
        Map<String, dynamic> json) =>
    PlayerTimingsDataModel(
      timings: PlayerTimingsModelData.fromJson(
          json['timings'] as Map<String, dynamic>),
      date:
          PlayerTimingsModelDate.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerTimingsDataModelToJson(
        PlayerTimingsDataModel instance) =>
    <String, dynamic>{
      'timings': instance.timings,
      'date': instance.date,
    };

PlayerTimingsModelData _$PlayerTimingsModelDataFromJson(
        Map<String, dynamic> json) =>
    PlayerTimingsModelData(
      fajr: json['Fajr'] as String,
      sunrise: json['Sunrise'] as String,
      dhuhr: json['Dhuhr'] as String,
      asr: json['Asr'] as String,
      sunset: json['Sunset'] as String,
      maghrib: json['Maghrib'] as String,
      isha: json['Isha'] as String,
      imsak: json['Imsak'] as String,
      midNight: json['Midnight'] as String,
      firstThird: json['Firstthird'] as String,
      lastThird: json['Lastthird'] as String,
    );

Map<String, dynamic> _$PlayerTimingsModelDataToJson(
        PlayerTimingsModelData instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'Midnight': instance.midNight,
      'Firstthird': instance.firstThird,
      'Lastthird': instance.lastThird,
    };

PlayerTimingsModelDate _$PlayerTimingsModelDateFromJson(
        Map<String, dynamic> json) =>
    PlayerTimingsModelDate(
      readableCurrentDate: json['readable'] as String,
      hijriDate: Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
      gregorianDate:
          Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerTimingsModelDateToJson(
        PlayerTimingsModelDate instance) =>
    <String, dynamic>{
      'readable': instance.readableCurrentDate,
      'hijri': instance.hijriDate,
      'gregorian': instance.gregorianDate,
    };

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
      date: json['date'] as String,
      day: json['day'] as String,
      weekDay: WeekDay.fromJson(json['weekday'] as Map<String, dynamic>),
      month: Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
    );

Map<String, dynamic> _$HijriToJson(Hijri instance) => <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'weekday': instance.weekDay,
      'month': instance.month,
      'year': instance.year,
    };

WeekDay _$WeekDayFromJson(Map<String, dynamic> json) => WeekDay(
      dayInArabic: json['ar'] as String,
      dayInEnglish: json['en'] as String,
    );

Map<String, dynamic> _$WeekDayToJson(WeekDay instance) => <String, dynamic>{
      'ar': instance.dayInArabic,
      'en': instance.dayInEnglish,
    };

Month _$MonthFromJson(Map<String, dynamic> json) => Month(
      dayInArabic: json['ar'] as String,
      dayInEnglish: json['en'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$MonthToJson(Month instance) => <String, dynamic>{
      'number': instance.number,
      'ar': instance.dayInArabic,
      'en': instance.dayInEnglish,
    };

Gregorian _$GregorianFromJson(Map<String, dynamic> json) => Gregorian(
      gregorianDate: json['date'] as String,
      gregorianDay: json['day'] as String,
      gregorianWeekDay:
          GregorianWeekDay.fromJson(json['weekday'] as Map<String, dynamic>),
      gregorianMonth:
          GregorianMonth.fromJson(json['month'] as Map<String, dynamic>),
      gregorianYear: json['year'] as String,
    );

Map<String, dynamic> _$GregorianToJson(Gregorian instance) => <String, dynamic>{
      'date': instance.gregorianDate,
      'day': instance.gregorianDay,
      'weekday': instance.gregorianWeekDay,
      'month': instance.gregorianMonth,
      'year': instance.gregorianYear,
    };

GregorianWeekDay _$GregorianWeekDayFromJson(Map<String, dynamic> json) =>
    GregorianWeekDay(
      dayInEnglish: json['en'] as String,
    );

Map<String, dynamic> _$GregorianWeekDayToJson(GregorianWeekDay instance) =>
    <String, dynamic>{
      'en': instance.dayInEnglish,
    };

GregorianMonth _$GregorianMonthFromJson(Map<String, dynamic> json) =>
    GregorianMonth(
      dayInEnglish: json['en'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$GregorianMonthToJson(GregorianMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.dayInEnglish,
    };
