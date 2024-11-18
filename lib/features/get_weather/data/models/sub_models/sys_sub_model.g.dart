part of 'sys_sub_model.dart';

class SysModelAdapter extends TypeAdapter<SysModel> {
  @override
  final int typeId = 43;

  @override
  SysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SysModel(
      country: fields[2] as String,
      sunrise: fields[3] as int,
      sunset: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SysModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.sunrise)
      ..writeByte(4)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
