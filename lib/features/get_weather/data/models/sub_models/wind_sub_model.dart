import 'dart:convert';
import 'package:hive/hive.dart';

part 'wind_sub_model.g.dart';

@HiveType(typeId: 34)
class Wind {
  @HiveField(0)
  final double speed;

  @HiveField(1)
  final int deg;

  @HiveField(2)
  final double? gust;

  Wind({required this.speed, required this.deg, this.gust});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
      gust: map['gust'] != null ? map['gust'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}
