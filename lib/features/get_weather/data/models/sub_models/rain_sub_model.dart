import 'dart:convert';
import 'package:hive/hive.dart';

part 'rain_sub_model.g.dart';

@HiveType(typeId: 49)
class Rain {
  @HiveField(0)
  final double oneHour;

  Rain({required this.oneHour});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oneHour': oneHour,
    };
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      oneHour: map['1h'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) =>
      Rain.fromMap(json.decode(source) as Map<String, dynamic>);
}
