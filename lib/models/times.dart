import 'package:flutter/foundation.dart';

@immutable
class Times {
  const Times({
    required this.imsak,
    required this.sunrise,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });

  final String imsak;
  final String sunrise;
  final String fajr;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String midnight;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
      imsak: json['Imsak'] as String,
      sunrise: json['Sunrise'] as String,
      fajr: json['Fajr'] as String,
      dhuhr: json['Dhuhr'] as String,
      asr: json['Asr'] as String,
      sunset: json['Sunset'] as String,
      maghrib: json['Maghrib'] as String,
      isha: json['Isha'] as String,
      midnight: json['Midnight'] as String);

  Map<String, dynamic> toJson() => {
        'Imsak': imsak,
        'Sunrise': sunrise,
        'Fajr': fajr,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Midnight': midnight
      };

  Times clone() => Times(
      imsak: imsak,
      sunrise: sunrise,
      fajr: fajr,
      dhuhr: dhuhr,
      asr: asr,
      sunset: sunset,
      maghrib: maghrib,
      isha: isha,
      midnight: midnight);

  Times copyWith(
          {String? imsak,
          String? sunrise,
          String? fajr,
          String? dhuhr,
          String? asr,
          String? sunset,
          String? maghrib,
          String? isha,
          String? midnight}) =>
      Times(
        imsak: imsak ?? this.imsak,
        sunrise: sunrise ?? this.sunrise,
        fajr: fajr ?? this.fajr,
        dhuhr: dhuhr ?? this.dhuhr,
        asr: asr ?? this.asr,
        sunset: sunset ?? this.sunset,
        maghrib: maghrib ?? this.maghrib,
        isha: isha ?? this.isha,
        midnight: midnight ?? this.midnight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Times &&
          imsak == other.imsak &&
          sunrise == other.sunrise &&
          fajr == other.fajr &&
          dhuhr == other.dhuhr &&
          asr == other.asr &&
          sunset == other.sunset &&
          maghrib == other.maghrib &&
          isha == other.isha &&
          midnight == other.midnight;

  @override
  int get hashCode =>
      imsak.hashCode ^
      sunrise.hashCode ^
      fajr.hashCode ^
      dhuhr.hashCode ^
      asr.hashCode ^
      sunset.hashCode ^
      maghrib.hashCode ^
      isha.hashCode ^
      midnight.hashCode;
}
