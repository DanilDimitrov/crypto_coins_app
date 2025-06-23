// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinAdapter extends TypeAdapter<CryptoCoin> {
  @override
  final int typeId = 1;

  @override
  CryptoCoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoin(
      name: fields[1] as String,
      priceInUSD: fields[2] as double,
      imageUrl: fields[3] as String,
      highDay: fields[4] as double,
      lowDay: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoin obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.priceInUSD)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.highDay)
      ..writeByte(5)
      ..write(obj.lowDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
