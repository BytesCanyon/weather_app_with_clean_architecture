import 'dart:convert';
import 'package:hive/hive.dart';

part 'clouds_sub_model.g.dart';

@HiveType(typeId: 63)
class Clouds {
  @HiveField(64)
  final int all;

  Clouds({required this.all});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) =>
      Clouds.fromMap(json.decode(source) as Map<String, dynamic>);
}
