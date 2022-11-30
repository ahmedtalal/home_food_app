import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

class StorageUserModel extends GetxController {
  final _storage = GetStorage();
  Future<void> initStorage() async {
    await GetStorage.init();
  }

  saveData(var data) async {
   await  _storage.write(userKey, data);
  }

  Map<String, dynamic> loadData() {
    return _storage.read(userKey) ?? {};
  }
}
