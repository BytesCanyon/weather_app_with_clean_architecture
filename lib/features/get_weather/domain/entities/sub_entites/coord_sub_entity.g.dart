part of 'coord_sub_entity.dart';

class CoordEntityAdapter extends TypeAdapter<CoordEntity> {
  @override
  final int typeId = 22;

  @override
  CoordEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordEntity(
      lon: fields[0] as double,
      lat: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoordEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
