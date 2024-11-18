import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../domain/entities/sub_entites/coord_sub_entity.dart';
part 'coord_sub_model.g.dart';

@HiveType(typeId: 60)
class CoordModel extends CoordEntity {
  @override
  @HiveField(61)
  final double lon;

  @override
  @HiveField(62)
  final double lat;

  CoordModel({required this.lon, required this.lat})
      : super(lon: lon, lat: lat);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordModel.fromJson(String source) =>
      CoordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
