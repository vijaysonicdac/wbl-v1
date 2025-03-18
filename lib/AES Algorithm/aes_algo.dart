import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  final String Key = "R18S19T20U21V22W";
  final String IV = "J10K11L12M13N14O";

  String encryptCrendiential(String value) {
    final encerptKey = encrypt.Key.fromUtf8(Key.padRight(16, ''));
    final ivParam = encrypt.IV.fromUtf8(IV.padRight(16, ''));
    final encrypter =
        encrypt.Encrypter(encrypt.AES(encerptKey, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(value, iv: ivParam);
    return encrypted.base64;
  }
}
