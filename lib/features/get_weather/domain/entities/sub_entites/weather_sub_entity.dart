import 'package:hive/hive.dart';

part 'weather_sub_entity.g.dart';

@HiveType(typeId: 7)
class WeatherSubEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String main;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  WeatherSubEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherSubEntity.fromMap(Map<String, dynamic> map) {
    return WeatherSubEntity(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}
