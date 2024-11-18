import 'package:hive/hive.dart';

part 'main_sub_entity.g.dart';

@HiveType(typeId: 16)
class MainEntity {
  @HiveField(0)
  final double temp;

  @HiveField(1)
  final double feelsLike;

  @HiveField(2)
  final double tempMin;

  @HiveField(3)
  final double tempMax;

  @HiveField(4)
  final int humidity;

  MainEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory MainEntity.fromMap(Map<String, dynamic> map) {
    return MainEntity(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['tempMin'],
      tempMax: map['tempMax'],
      humidity: map['humidity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidity': humidity,
    };
  }
}
