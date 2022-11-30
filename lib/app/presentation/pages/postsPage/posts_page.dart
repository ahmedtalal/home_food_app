import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/presentation/shared/widgets/header_shared_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        margin:
            EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSharedWidget(title: "Posts"),
          ],
        ),
      ),
    );
  }
}
