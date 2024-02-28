import 'package:flutter/foundation.dart';

@immutable
class Date {
  const Date({
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  final int timestamp;
  final String gregorian;
  final String hijri;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
      timestamp: json['timestamp'] as int,
      gregorian: json['gregorian'] as String,
      hijri: json['hijri'] as String);

  Map<String, dynamic> toJson() =>
      {'timestamp': timestamp, 'gregorian': gregorian, 'hijri': hijri};

  Date clone() =>
      Date(timestamp: timestamp, gregorian: gregorian, hijri: hijri);

  Date copyWith({int? timestamp, String? gregorian, String? hijri}) => Date(
        timestamp: timestamp ?? this.timestamp,
        gregorian: gregorian ?? this.gregorian,
        hijri: hijri ?? this.hijri,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Date &&
          timestamp == other.timestamp &&
          gregorian == other.gregorian &&
          hijri == other.hijri;

  @override
  int get hashCode => timestamp.hashCode ^ gregorian.hashCode ^ hijri.hashCode;
}
