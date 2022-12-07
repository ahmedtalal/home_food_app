import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/widgets/iamge_builder.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/widgets/page_decoration.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/widgets/slider_page_view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: IntroductionScreen(
            pages: [
              SliderPageView(
                title: "Quick delivery",
                body: "Orders your favorite meals will be immediately deliver",
                image: imageBuilder(quickDeliveryImg, context),
                decoration: getPageDecoration(),
              ),
              SliderPageView(
                title: "Cooking safe food",
                body:
                    "We are maintain safty and we keep clean while making food",
                image: imageBuilder(cookingFoodImg, context),
                decoration: getPageDecoration(),
              ),
              SliderPageView(
                title: "Order your food",
                body: "Now you can order food any time right from your mobile",
                image: imageBuilder(orderFoodImg, context),
                decoration: getPageDecoration(),
              ),
            ],
            next: Icon(
              Icons.arrow_forward,
              size: 22,
              color: Colors.black,
            ),
            done: Text(
              "Ready",
              style: TextStyle(
                fontSize: 18,
                fontFamily: appFont,
                fontWeight: FontWeight.w700,
                color: customeColor3,
              ),
            ),
            onDone: () {
              Get.off(() => RegisterPage());
            },
            showSkipButton: true,
            skip: Text(
              "skip",
              style: TextStyle(
                fontSize: 15.5,
                fontFamily: appFont,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            onSkip: () => Get.off(() => RegisterPage()),
            skipOrBackFlex: 0,
            nextFlex: 0,
            animationDuration: 500,
            dotsDecorator: DotsDecorator(
              activeColor: customeColor2,
              color: Colors.blueGrey,
              size: Size(10, 10),
              activeSize: Size(22, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
