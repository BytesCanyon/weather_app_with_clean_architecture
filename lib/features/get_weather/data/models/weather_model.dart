import 'package:hive/hive.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/coord_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/main_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/sys_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/weather_sub_entity.dart';
import '../../domain/entities/weather_entitie.dart';
import 'sub_models/clouds_sub_model.dart';
import 'sub_models/rain_sub_model.dart';
import 'sub_models/wind_sub_model.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 25)
class WeatherModel extends WeatherEntity {
  @HiveField(0)
  final String base;

  @HiveField(1)
  final int visibility;

  @HiveField(2)
  final Wind wind;

  @HiveField(3)
  final Rain? rain;

  @HiveField(4)
  final Clouds clouds;

  @HiveField(5)
  final int dt;

  @HiveField(6)
  final int id;

  @HiveField(7)
  final int cod;

  @override
  @HiveField(8)
  final CoordEntity coord;

  @override
  @HiveField(9)
  final List<WeatherSubEntity> weather;

  @override
  @HiveField(10)
  final MainEntity main;

  @override
  @HiveField(11)
  final SysEntity sys;

  @override
  @HiveField(12)
  final int timezone;

  @override
  @HiveField(13)
  final String name;

  WeatherModel({
    required this.base,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.id,
    required this.cod,
    required this.coord,
    required this.weather,
    required this.main,
    required this.sys,
    required this.timezone,
    required this.name,
  }) : super(
          coord: coord,
          weather: weather,
          main: main,
          sys: sys,
          timezone: timezone,
          name: name,
        );
}
