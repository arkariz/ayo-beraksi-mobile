// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laporan_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaporanItemModelAdapter extends TypeAdapter<LaporanItemModel> {
  @override
  final int typeId = 3;

  @override
  LaporanItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LaporanItemModel(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as int,
      fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LaporanItemModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.noLaporan)
      ..writeByte(1)
      ..write(obj.pengirim)
      ..writeByte(2)
      ..write(obj.namaTerlapor)
      ..writeByte(3)
      ..write(obj.jabatan)
      ..writeByte(4)
      ..write(obj.instansi)
      ..writeByte(5)
      ..write(obj.namaPelapor)
      ..writeByte(6)
      ..write(obj.tanggalKejadian)
      ..writeByte(7)
      ..write(obj.tanggalPelaporan)
      ..writeByte(8)
      ..write(obj.kronologisKejadian)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.deskripsiStatus)
      ..writeByte(11)
      ..write(obj.tindakLanjut)
      ..writeByte(12)
      ..write(obj.id)
      ..writeByte(13)
      ..write(obj.tipeLaporan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaporanItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
