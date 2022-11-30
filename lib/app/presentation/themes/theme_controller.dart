import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  static const _THEMEKEY = "themeKey";

  bool _getThemeKeyValue() => _storage.read(_THEMEKEY) ?? false;
  setThemeKeyValue(bool isDark) => _storage.write(_THEMEKEY, isDark);
  ThemeMode get theme => _getThemeKeyValue() ? ThemeMode.dark : ThemeMode.light;
  setThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
