part of 'main_sub_entity.dart';

class MainEntityAdapter extends TypeAdapter<MainEntity> {
  @override
  final int typeId = 16;

  @override
  MainEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainEntity(
      temp: fields[0] as double,
      feelsLike: fields[1] as double,
      tempMin: fields[2] as double,
      tempMax: fields[3] as double,
      humidity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MainEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feelsLike)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.tempMax)
      ..writeByte(4)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
