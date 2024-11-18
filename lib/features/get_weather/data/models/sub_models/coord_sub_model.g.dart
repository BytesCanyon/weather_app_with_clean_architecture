part of 'coord_sub_model.dart';

class CoordModelAdapter extends TypeAdapter<CoordModel> {
  @override
  final int typeId = 60;

  @override
  CoordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordModel(
      lon: fields[61] as double,
      lat: fields[62] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoordModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(61)
      ..write(obj.lon)
      ..writeByte(62)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
