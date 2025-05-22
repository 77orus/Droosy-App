import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();
  static final String _firstTimeKey = 'isFirstTime';

  static Future<void> init() async {
    await GetStorage.init();
  }

  static bool isFirstTime() {
    return _box.read(_firstTimeKey) ?? true;
  }

  static Future<void> setFirstTime(bool value) async {
    await _box.write(_firstTimeKey, value);
  }
}
