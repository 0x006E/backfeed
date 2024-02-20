// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_thought_repository.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalThoughtAdapter extends TypeAdapter<LocalThought> {
  @override
  final int typeId = 0;

  @override
  LocalThought read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalThought(
      id: fields[0] as String,
      content: (fields[1] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalThought obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalThoughtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
