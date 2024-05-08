import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_bill_app/Api/api_manager.dart';
import 'package:water_bill_app/Model/login_success_model.dart';
import 'package:water_bill_app/Repository/authentication_repository.dart';
import 'package:water_bill_app/Utils/constants.dart';
import 'package:water_bill_app/Utils/string_constant.dart';

import '../Routes/routes.dart';

class LoginController extends GetxController {
  AuthenticationRepository authenticationRepository = AuthenticationRepository(APIManager());
  TextEditingController emaiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<LoginSuccessModel> loginDetails = LoginSuccessModel().obs;

  RxBool passwordVisible = true.obs;

  signIn(BuildContext context) async {
    loginDetails.value = await authenticationRepository.loginApiCall({"UserName": emaiController.text, "Password": passwordController.text});
    if (loginDetails.value.status == 1) {
      GetStorage().write(userData, loginDetails.toJson());
      /// success message & navigation
      successSnackBar(message: 'Login In Successfully.');
      // successSnackBar(message: loginDetails.value.message);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen()), (route) => false);
      Get.offAllNamed(Routes.DASHBOARD_SCREEN);
    } else {
      errorSnackBar(message: loginDetails.value.message);
    }
  }
}
