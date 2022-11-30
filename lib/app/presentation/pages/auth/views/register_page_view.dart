import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/presentation/pages/auth/widgets/auth_logo_widget.dart';
import 'package:social_media_network/app/presentation/pages/auth/widgets/register_form_fields_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 8),
              const AuthLogoWidget(),
              const RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
