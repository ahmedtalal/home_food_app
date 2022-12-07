import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/pages/notificationspage/notifications_page.dart';
import 'package:social_media_network/app/presentation/pages/homePage/logic/home_page_controller.dart';
import 'package:social_media_network/app/presentation/pages/homePage/widgets/bubble_items.dart';
import 'package:social_media_network/app/presentation/pages/marketPlacePage/market_place_page.dart';
import 'package:social_media_network/app/presentation/pages/postsPage/posts_page.dart';
import 'package:social_media_network/app/presentation/pages/searchPage/search_page.dart';
import 'package:social_media_network/app/presentation/pages/settingsPage/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    PostsPage(),
    SearchPage(),
    NotificationsPage(),
    MarketPlacePage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BubbleBottomBar(
            hasNotch: false,
            opacity: 0.9,
            currentIndex: controller.currentIndex,
            onTap: controller.switchPages,
            elevation: 3.0,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            items: [
              //home page
              BubbleItems(
                title: "posts",
                backgroundColor: customeColor1,
                iamge: postImg,
              ),

              // search page
              BubbleItems(
                title: "search",
                backgroundColor: customeColor2,
                iamge: searchImg,
              ),
              BubbleItems(
                title: "notifications",
                backgroundColor: customeColor3,
                iamge: notificationImg,
              ),
              BubbleItems(
                title: "market",
                backgroundColor: customeColor4,
                iamge: marketplaceImg,
              ),
              BubbleItems(
                title: "settings",
                backgroundColor: customRedColor,
                iamge: settingsImg,
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: pages.elementAt(controller.currentIndex),
          ),
        );
      },
    );
  }
}
