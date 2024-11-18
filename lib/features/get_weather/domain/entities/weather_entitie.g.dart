part of 'weather_entitie.dart';

class WeatherEntityAdapter extends TypeAdapter<WeatherEntity> {
  @override
  final int typeId = 0;

  @override
  WeatherEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherEntity(
      coord: fields[1] as CoordEntity,
      weather: (fields[2] as List).cast<WeatherSubEntity>(),
      main: fields[3] as MainEntity,
      sys: fields[4] as SysEntity,
      timezone: fields[5] as int,
      name: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.coord)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.main)
      ..writeByte(4)
      ..write(obj.sys)
      ..writeByte(5)
      ..write(obj.timezone)
      ..writeByte(6)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
