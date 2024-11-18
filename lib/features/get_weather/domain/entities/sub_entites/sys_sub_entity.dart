import 'package:hive/hive.dart';

part 'sys_sub_entity.g.dart';

@HiveType(typeId: 12)
class SysEntity {
  @HiveField(0)
  final String country;

  @HiveField(1)
  final int sunrise;

  @HiveField(2)
  final int sunset;

  SysEntity({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysEntity.fromMap(Map<String, dynamic> map) {
    return SysEntity(
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}
