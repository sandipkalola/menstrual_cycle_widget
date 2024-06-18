import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';

class Encryption {
  final String _utf8 = "11a1215l0119a140409p0919";
  final String _ivUtf8 = "23a1dfr5lyhd9a1404845001";

  static final Encryption instance = Encryption.init();

  late IV _iv;
  late Encrypter _encrypter;

  Encryption.init() {
    final keyUtf8 = utf8.encode(_utf8);
    final ivUtf8 = utf8.encode(_ivUtf8);
    final key = sha256.convert(keyUtf8).toString().substring(0, 32);
    final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
    _iv = IV.fromUtf8(iv);
    _encrypter = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
  }

  /// this function encrypt data
  String encrypt(String value) {
    return _encrypter.encrypt(value, iv: _iv).base64;
  }

  /// decrypt data
  String decrypt(String base64value) {
    final encrypted = Encrypted.fromBase64(base64value);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}
