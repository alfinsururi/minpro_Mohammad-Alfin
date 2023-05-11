import 'package:hive/hive.dart';

late Box mainStorage;

class DB {
  static save(String key, dynamic value) async {
    await mainStorage.put(key, value);
  }

  static get(String key) {
    return mainStorage.get(key);
  }
}
