import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/data/repository/apis/auth_api_repository_imp.dart';
import 'package:social_media_network/app/data/services/local/storage_user_model.dart';
import 'package:social_media_network/app/domain/usecases/auth/userislogin_usecase.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:social_media_network/app/presentation/pages/homePage//home_page.dart';
import 'package:social_media_network/app/presentation/routes/app_pages.dart';
import 'package:social_media_network/app/presentation/themes/theme_controller.dart';

void main() async {
  await Get.put(StorageUserModel()).initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final themeController = Get.put(ThemeController());
  static final _userIsLoginUseCase =
      UserIsLoginUseCase(iAuthRepository: AuthApiRepositoryImp.instance);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,
      home: _userIsLoginUseCase.call() ? HomePage() : SplashScreenPage(),
      getPages: AppPages.pages,
    );
  }
}
