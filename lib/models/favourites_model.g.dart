// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouritesModelAdapter extends TypeAdapter<FavouritesModel> {
  @override
  final int typeId = 0;

  @override
  FavouritesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouritesModel(
      blogId: fields[0] as String,
      blogTitle: fields[1] as String,
      imageUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouritesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.blogId)
      ..writeByte(1)
      ..write(obj.blogTitle)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouritesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
