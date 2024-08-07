library zip_encryption;

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;

class ZipEncryption {
  final int key;

  ZipEncryption(this.key);

  Uint8List logicalOperatorEncrypt(Uint8List data) {
    final Uint8List result = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      result[i] = data[i] ^ key;
    }
    return result;
  }

  Future<bool> encryptAndStoreZip({required String zipFilePath, required String encryptedFilePath}) async {
    try {
      final File zipFile = File(path.normalize(zipFilePath));
      if (!await zipFile.exists()) {
        throw Exception('The zip file does not exist at the provided path: $zipFilePath');
      }
      final Uint8List bytes = await zipFile.readAsBytes();

      final Uint8List encryptedBytes = logicalOperatorEncrypt(bytes);

      final File encryptedFile = File(path.normalize(encryptedFilePath));
      await encryptedFile.writeAsBytes(encryptedBytes);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> decryptAndStoreZip({required String encryptedFilePath, required String decryptedFilePath}) async {
    try {
      final File encryptedFile = File(path.normalize(encryptedFilePath));
      if (!await encryptedFile.exists()) {
        throw Exception('The encrypted file does not exist at the provided path: $encryptedFilePath');
      }
      final Uint8List encryptedBytes = await encryptedFile.readAsBytes();

      final Uint8List decryptedBytes = logicalOperatorEncrypt(encryptedBytes);

      final File decryptedFile = File(path.normalize(decryptedFilePath));
      await decryptedFile.writeAsBytes(decryptedBytes);

      return true;
    } catch (e) {
      return false;
    }
  }



}

