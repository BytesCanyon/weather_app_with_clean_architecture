part of 'rain_sub_model.dart';

class RainAdapter extends TypeAdapter<Rain> {
  @override
  final int typeId = 49;

  @override
  Rain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rain(
      oneHour: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Rain obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.oneHour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
