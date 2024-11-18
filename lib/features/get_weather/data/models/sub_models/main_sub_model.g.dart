part of 'main_sub_model.dart';

class MainModelAdapter extends TypeAdapter<MainModel> {
  @override
  final int typeId = 51;

  @override
  MainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainModel(
      temp: fields[52] as double,
      feelsLike: fields[53] as double,
      tempMin: fields[54] as double,
      tempMax: fields[55] as double,
      pressure: fields[56] as int,
      humidity: fields[57] as int,
      seaLevel: fields[58] as int,
      grndLevel: fields[59] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MainModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(52)
      ..write(obj.temp)
      ..writeByte(53)
      ..write(obj.feelsLike)
      ..writeByte(54)
      ..write(obj.tempMin)
      ..writeByte(55)
      ..write(obj.tempMax)
      ..writeByte(56)
      ..write(obj.pressure)
      ..writeByte(57)
      ..write(obj.humidity)
      ..writeByte(58)
      ..write(obj.seaLevel)
      ..writeByte(59)
      ..write(obj.grndLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
