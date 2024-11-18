import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../domain/entities/sub_entites/sys_sub_entity.dart';

part 'sys_sub_model.g.dart';

@HiveType(typeId: 43)
class SysModel extends SysEntity {
  @override
  @HiveField(2)
  final String country;

  @override
  @HiveField(3)
  final int sunrise;

  @override
  @HiveField(4)
  final int sunset;

  SysModel({
    required this.country,
    required this.sunrise,
    required this.sunset,
  }) : super(country: country, sunrise: sunrise, sunset: sunset);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      country: map['country'] as String,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
