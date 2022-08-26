import 'package:first_app/model/password_item.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class SecureDbService {
//   final _storage = const FlutterSecureStorage();
//
//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//         encryptedSharedPreferences: true,
//       );

//   Future<void> writeSecureData(PasswordItem newItem) async {
//     debugPrint("Writing new data having key ${newItem.name}");
//     await _storage.write(
//         key: newItem.id, value: newItem.value, aOptions: _getAndroidOptions());
//   }
//
//   Future<String?> readSecureData(String key) async {
//     debugPrint("Reading data having key $key");
//     var readData =
//         await _storage.read(key: key, aOptions: _getAndroidOptions());
//     return readData;
//   }
//
//   Future<void> deleteSecureData(PasswordItem item) async {
//     debugPrint("Deleting data having key ${item.key}");
//     await _storage.delete(key: item.key, aOptions: _getAndroidOptions());
//   }
//
//   Future<List<PasswordItem>> readAllSecureData() async {
//     debugPrint("Reading all secured data");
//     var allData = await _storage.readAll(aOptions: _getAndroidOptions());
//     List<PasswordItem> list =
//         allData.entries.map((e) => PasswordItem(e.key, e.value)).toList();
//     return list;
//   }
//
//   Future<void> deleteAllSecureData() async {
//     debugPrint("Deleting all secured data");
//     await _storage.deleteAll(aOptions: _getAndroidOptions());
//   }
//
//   Future<bool> containsKeyInSecureData(String key) async {
//     debugPrint("Checking data for the key $key");
//     var containsKey =
//         await _storage.containsKey(key: key, aOptions: _getAndroidOptions());
//     return containsKey;
//   }
//}
