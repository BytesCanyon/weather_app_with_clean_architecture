import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../domain/entities/sub_entites/weather_sub_entity.dart';

part 'weather_sub_model.g.dart';

@HiveType(typeId: 38)
class WeatherSubModel extends WeatherSubEntity {
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String main;

  @override
  @HiveField(2)
  final String description;

  @override
  @HiveField(3)
  final String icon;

  WeatherSubModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }) : super(id: id, main: main, description: description, icon: icon);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherSubModel.fromMap(Map<String, dynamic> map) {
    return WeatherSubModel(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSubModel.fromJson(String source) =>
      WeatherSubModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
