import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_media_network/app/presentation/pages/auth/logic/getx/auth_page_binding.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/login_page_view.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:social_media_network/app/presentation/pages/homePage/home_page.dart';
import 'package:social_media_network/app/presentation/pages/homePage/logic/home_page_binding.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:social_media_network/app/presentation/pages/userprofile/userprofile_page.dart';
import 'package:social_media_network/app/presentation/routes/app_routes.dart';
import 'package:social_media_network/app/presentation/pages/userprofile/logic/getx/userprofile_binding.dart';
class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreenRoute,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: AppRoutes.loginScreenRoute,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.registerScreenRoute,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreenRoute,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfileRoute,
      page: () => UserProfilePage(),
      binding: UserProfileBinding(),
    ),
  ];
}
