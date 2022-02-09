// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_item_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_list_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_hive_model.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class LaporanLocalDatasource {
  Future<LaporanListModel> getLaporanCache();

  Future<void> cacheLaporan(LaporanItemModel laporanToCahe);

  // Future<void> deleteUser();
}

class LaporanLocalDatasourceImpl implements LaporanLocalDatasource {
  @override
  Future<LaporanListModel> getLaporanCache() async {
    var userBox = await Hive.openBox<LaporanItemModel>(CACHED_LAPORAN);

    List<LaporanItem> laporanList = [];

    userBox.watch().asyncMap((event) => {laporanList.add(event.value)});

    return LaporanListModel(laporanList);
  }

  @override
  Future<void> cacheLaporan(LaporanItemModel laporanToCahe) async {
    var userBox = await Hive.openBox<LaporanItemModel>(CACHED_LAPORAN);
    userBox.add(laporanToCahe);
  }

  // @override
  // Future<void> deleteUser() async {
  //   var keyBox = await Hive.openBox(CACHE_KEYBOX);
  //   if (!keyBox.containsKey('key')) {
  //     var key = Hive.generateSecureKey();
  //     keyBox.put('key', key);
  //   }

  //   var key = keyBox.get('key') as Uint8List;

  //   var userBox = await Hive.openBox<LaporanItemModel>(CACHED_LAPORAN, encryptionCipher: HiveAesCipher(key));
  //   userBox.delete('user');
  // }
}
