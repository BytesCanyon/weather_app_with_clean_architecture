part of 'sys_sub_entity.dart';

class SysEntityAdapter extends TypeAdapter<SysEntity> {
  @override
  final int typeId = 12;

  @override
  SysEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SysEntity(
      country: fields[0] as String,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SysEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
