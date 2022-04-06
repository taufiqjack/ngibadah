import 'package:flutter/foundation.dart';

@immutable
class Locations {
  const Locations({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.timezone,
    required this.localOffset,
  });

  final int latitude;
  final int longitude;
  final int elevation;
  final String city;
  final String country;
  final String countryCode;
  final String timezone;
  final double localOffset;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
      latitude: json['latitude'] as int,
      longitude: json['longitude'] as int,
      elevation: json['elevation'] as int,
      city: json['city'] as String,
      country: json['country'] as String,
      countryCode: json['country_code'] as String,
      timezone: json['timezone'] as String,
      localOffset: json['local_offset'] as double);

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'elevation': elevation,
        'city': city,
        'country': country,
        'country_code': countryCode,
        'timezone': timezone,
        'local_offset': localOffset
      };

  Locations clone() => Locations(
      latitude: latitude,
      longitude: longitude,
      elevation: elevation,
      city: city,
      country: country,
      countryCode: countryCode,
      timezone: timezone,
      localOffset: localOffset);

  Locations copyWith(
          {int? latitude,
          int? longitude,
          int? elevation,
          String? city,
          String? country,
          String? countryCode,
          String? timezone,
          double? localOffset}) =>
      Locations(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        elevation: elevation ?? this.elevation,
        city: city ?? this.city,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        timezone: timezone ?? this.timezone,
        localOffset: localOffset ?? this.localOffset,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Locations &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          elevation == other.elevation &&
          city == other.city &&
          country == other.country &&
          countryCode == other.countryCode &&
          timezone == other.timezone &&
          localOffset == other.localOffset;

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      elevation.hashCode ^
      city.hashCode ^
      country.hashCode ^
      countryCode.hashCode ^
      timezone.hashCode ^
      localOffset.hashCode;
}
