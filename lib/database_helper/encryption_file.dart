import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import '../menstrual_cycle_widget_base.dart';

class Encryption {
  static final Encryption instance = Encryption.init();

  late IV _iv;
  late Encrypter _encryption;

  Encryption.init() {
    final instance = MenstrualCycleWidget.instance!;
    final keyUtf8 = utf8.encode(instance.getSecretKey());
    final ivUtf8 = utf8.encode(instance.getIvKey());
    final key = sha256.convert(keyUtf8).toString().substring(0, 32);
    final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
    _iv = IV.fromUtf8(iv);
    _encryption = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
  }

  /// this function encrypt data
  String encrypt(String value) {
    return _encryption.encrypt(value, iv: _iv).base64;
  }

  /// decrypt data
  String decrypt(String base64value) {
    final encrypted = Encrypted.fromBase64(base64value);
    return _encryption.decrypt(encrypted, iv: _iv);
  }
}
