part of 'weather_model.dart';

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 25;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      base: fields[0] as String,
      visibility: fields[1] as int,
      wind: fields[2] as Wind,
      rain: fields[3] as Rain?,
      clouds: fields[4] as Clouds,
      dt: fields[5] as int,
      id: fields[6] as int,
      cod: fields[7] as int,
      coord: fields[8] as CoordEntity,
      weather: (fields[9] as List).cast<WeatherSubEntity>(),
      main: fields[10] as MainEntity,
      sys: fields[11] as SysEntity,
      timezone: fields[12] as int,
      name: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.visibility)
      ..writeByte(2)
      ..write(obj.wind)
      ..writeByte(3)
      ..write(obj.rain)
      ..writeByte(4)
      ..write(obj.clouds)
      ..writeByte(5)
      ..write(obj.dt)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.cod)
      ..writeByte(8)
      ..write(obj.coord)
      ..writeByte(9)
      ..write(obj.weather)
      ..writeByte(10)
      ..write(obj.main)
      ..writeByte(11)
      ..write(obj.sys)
      ..writeByte(12)
      ..write(obj.timezone)
      ..writeByte(13)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
