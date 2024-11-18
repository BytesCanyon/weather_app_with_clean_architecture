import 'package:hive/hive.dart';

part 'coord_sub_entity.g.dart';

@HiveType(typeId: 22)
class CoordEntity {
  @HiveField(0)
  final double lon;

  @HiveField(1)
  final double lat;

  CoordEntity({required this.lon, required this.lat});

  factory CoordEntity.fromMap(Map<String, dynamic> map) {
    return CoordEntity(
      lon: map['lon'],
      lat: map['lat'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}
