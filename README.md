# zip_encryption

`zip_encryption` is a Flutter package that provides functionality for encrypting and decrypting ZIP files on Windows. This package uses a simple XOR encryption method to secure the contents of ZIP files, making it easy to store and share encrypted data.

## Features

- Encrypt any ZIP file with a specified key.
- Decrypt any encrypted ZIP file with the specified key.
- Store the encrypted and decrypted files at user-defined paths.
- Easy-to-use API for encryption and decryption.
- Designed specifically for Windows.

## Getting Started

To start using `zip_encryption`, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  zip_encryption:
    git:
      url: https://github.com/Prashant-108538-Soni/zip_encryption.git
 ```

Then, run flutter pub get to install the package.

## Usage
Here's an example of how to use the zip_encryption package in your Flutter project.

### Encrypt a ZIP File

```
import 'package:zip_encryption/zip_encryption.dart';

void main() async {
  ZipEncryption zipEncryption = ZipEncryption(123);
  final bool success = await zipEncryption.encryptAndStoreZip(
    zipFilePath: 'C:\\path\\to\\your\\file.zip',
    encryptedFilePath: 'C:\\path\\to\\store\\encrypted_file.zip'
  );
  
  if (success) {
    print('File encrypted successfully');
  } else {
    print('Failed to encrypt file');
  }
}
```
### Decrypt a ZIP File

```
import 'package:zip_encryption/zip_encryption.dart';

void main() async {
  ZipEncryption zipEncryption = ZipEncryption(123);
  final bool success = await zipEncryption.decryptAndStoreZip(
    encryptedFilePath: 'C:\\path\\to\\encrypted_file.zip',
    decryptedFilePath: 'C:\\path\\to\\store\\decrypted_file.zip'
  );
  
  if (success) {
    print('File decrypted successfully');
  } else {
    print('Failed to decrypt file');
  }
}
```
## API Reference
### ZipEncryption
The ZipEncryption class provides the core functionality for encrypting and decrypting ZIP files.

### Constructor
```
ZipEncryption(int key)
```
key: The encryption key used for XOR encryption.
### Methods
Future<bool> encryptAndStoreZip({required String zipFilePath, required String encryptedFilePath})

Encrypts the specified ZIP file and stores the encrypted file at the given path.
* Parameters:
    * zipFilePath: The path to the ZIP file to be encrypted.
    * encryptedFilePath: The path where the encrypted file will be stored.
* Returns true if the operation is successful, otherwise false.


Future<bool> decryptAndStoreZip({required String encryptedFilePath, required String decryptedFilePath})

Decrypts the specified encrypted ZIP file and stores the decrypted file at the given path.
* Parameters:
    * encryptedFilePath: The path to the encrypted ZIP file.
    * decryptedFilePath: The path where the decrypted file will be stored.
* Returns true if the operation is successful, otherwise false.
## Design
The zip_encryption package is designed to provide a simple and efficient way to encrypt and decrypt ZIP files on Windows. The encryption method used is XOR encryption, which is lightweight and fast. This package is intended for use cases where basic encryption is sufficient.

## Key Components
* XOR Encryption: The package uses XOR encryption to encrypt and decrypt the contents of ZIP files. This method is chosen for its simplicity and speed.
* File Operations: The package handles reading from and writing to files, making it easy to store encrypted and decrypted files at user-specified locations.
* Error Handling: The package includes basic error handling to manage issues such as missing files or incorrect paths.

## Author
- Prashant Soni    [ps108538@gmail.com]
## Contributions
Contributions are welcome! If you find a bug or want to add a new feature, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

