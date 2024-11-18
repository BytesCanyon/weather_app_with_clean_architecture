import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../domain/entities/sub_entites/main_sub_entity.dart';

part 'main_sub_model.g.dart';

@HiveType(typeId: 51)
class MainModel extends MainEntity {
  @override
  @HiveField(52)
  final double temp;

  @override
  @HiveField(53)
  final double feelsLike;

  @override
  @HiveField(54)
  final double tempMin;

  @override
  @HiveField(55)
  final double tempMax;

  @HiveField(56)
  final int pressure;

  @override
  @HiveField(57)
  final int humidity;

  @HiveField(58)
  final int seaLevel;

  @HiveField(59)
  final int grndLevel;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  }) : super(
            temp: temp,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            humidity: humidity);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['sea_level'] as int,
      grndLevel: map['grnd_level'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) =>
      MainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
