import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Routes/routes.dart';
import '../Utils/app_color.dart';
import '../Utils/string_constant.dart';
import '../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    navigatToRoute();
    super.initState();
  }

  ///
  /// navigate according login users
  ///
  navigatToRoute() async {

    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) async {
        if (GetStorage().read(userData) == null) {
          Get.offAllNamed(Routes.LOGIN_SCREEN);
        } else {
          Get.offAllNamed(Routes.DASHBOARD_SCREEN);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: AppColors.splashbgColor,
        // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.assetsRectangle), fit: BoxFit.fill)),
    alignment: Alignment.center,
        child: Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.splashbgColor,
            backgroundImage: AssetImage(Assets.assetsAppLogo1),
          ),
        ),
      ),
    );
  }
}
