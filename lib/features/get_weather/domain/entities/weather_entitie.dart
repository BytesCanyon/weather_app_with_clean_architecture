import 'package:hive/hive.dart';
import 'sub_entites/coord_sub_entity.dart';
import 'sub_entites/main_sub_entity.dart';
import 'sub_entites/sys_sub_entity.dart';
import 'sub_entites/weather_sub_entity.dart';

part 'weather_entitie.g.dart';

@HiveType(typeId: 0)
class WeatherEntity {
  @HiveField(1)
  final CoordEntity coord;

  @HiveField(2)
  final List<WeatherSubEntity> weather;

  @HiveField(3)
  final MainEntity main;

  @HiveField(4)
  final SysEntity sys;

  @HiveField(5)
  final int timezone;

  @HiveField(6)
  final String name;
  bool isCached;

  WeatherEntity({
    required this.coord,
    required this.weather,
    required this.main,
    required this.sys,
    required this.timezone,
    required this.name,
    this.isCached = false,
  });
}
