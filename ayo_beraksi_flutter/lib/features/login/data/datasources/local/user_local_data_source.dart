// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/core/error/exceptions.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class UserLocalDataSource {
  Future<String?> getUserCache();

  Future<void> cacheUser(UserModel userToCache);

  Future<void> deleteUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<String?> getUserCache() async {
    var keyBox = await Hive.openBox(CACHE_KEYBOX);
    if (!keyBox.containsKey('key')) {
      var key = Hive.generateSecureKey();
      keyBox.put('key', key);
    }

    var key = keyBox.get('key') as Uint8List;

    var userBox = await Hive.openBox(CACHED_USER, encryptionCipher: HiveAesCipher(key));
    return userBox.get('user');
  }

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    var keyBox = await Hive.openBox(CACHE_KEYBOX);
    if (!keyBox.containsKey('key')) {
      var key = Hive.generateSecureKey();
      keyBox.put('key', key);
    }

    var key = keyBox.get('key') as Uint8List;

    var userBox = await Hive.openBox(CACHED_USER, encryptionCipher: HiveAesCipher(key));
    userBox.put('user', userToCache.token);
  }

  @override
  Future<void> deleteUser() async {
    var keyBox = await Hive.openBox(CACHE_KEYBOX);
    if (!keyBox.containsKey('key')) {
      var key = Hive.generateSecureKey();
      keyBox.put('key', key);
    }

    var key = keyBox.get('key') as Uint8List;

    var userBox = await Hive.openBox(CACHED_USER, encryptionCipher: HiveAesCipher(key));
    userBox.delete('user');
  }
}
