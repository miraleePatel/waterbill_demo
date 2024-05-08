import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/login_controller.dart';
import '../../Utils/app_color.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textformfield.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController loginController = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    loginController.emaiController.clear();
    loginController.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.assetsRectangle), fit: BoxFit.fill)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      height: 43.h,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.loginColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            // CustomWidgets.text(
                            //     loginText, fontWeight: FontWeight.w600),
                            /// ********************** Login *************************
                            CustomWidgets.text("เข้าสู่ระบบ", fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 3.h,
                            ),
                            /// ********************** username textfeild *************************
                            CustomTextFormField(
                              controller: loginController.emaiController,
                              maxLines: 1,
                              hintText: "Username",
                              obscureText: false,
                              validator: (value) {
                                if (value == null) {
                                  return null;
                                }
                                if (value.isEmpty) {
                                  return 'Username can\'t be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            /// ********************** password textfeild *************************
                            Obx(() {
                              return CustomTextFormField(
                                controller: loginController.passwordController,
                                maxLines: 1,
                                hintText: "Password",
                                obscureText: loginController.passwordVisible.value,
                                suffixIcon: GestureDetector(
                                  child: loginController.passwordVisible.value
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: AppColors.textBlackColor,
                                          size: 18.sp,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: AppColors.textBlackColor,
                                          size: 18.sp,
                                        ),
                                  onTap: () {
                                    loginController.passwordVisible.value = !loginController.passwordVisible.value;
                                  },
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return null;
                                  }
                                  if (value.isEmpty) {
                                    return 'Password can\'t be empty';
                                  } else if (value.length < 4) {
                                    return 'Enter a password with length at least 4';
                                  }
                                  return null;
                                },
                              );
                            }),
                            SizedBox(
                              height: 3.h,
                            ),
                            /// ***************** Login button **********************
                            CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  loginController.signIn(context);
                                }
                              },
                              color: AppColors.loginBtnColor,
                              child: CustomWidgets.text("เข้าสู่ระบบ", color: AppColors.textWhiteColor, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // CustomWidgets.text(forgot_password,
                            //     decoration: TextDecoration.underline,
                            //     color: AppColors.forgottextColor,
                            //     fontSize: 8.sp),
                            // CustomWidgets.text("ลืมรหัสผ่าน", decoration: TextDecoration.underline, color: AppColors.forgottextColor, fontSize: 8.sp),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        Assets.assetsVector1,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        Assets.assetsLoginbottom2,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 145,
                        left: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.splashbgColor,
                              backgroundImage: AssetImage(Assets.assetsAppLogo1),
                              // child: CustomWidgets.text("Logo \n App", color: AppColors.textBlackColor, fontWeight: FontWeight.w600, fontSize: 9.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomWidgets.text("ระบบประปา", color: AppColors.textWhiteColor, fontSize: 9.sp, fontWeight: FontWeight.w700),
                                SizedBox(
                                  width: 40.w,
                                  child: CustomWidgets.text("ราชการอิเล็กทรอนิกส์",
                                      color: AppColors.textWhiteColor, fontSize: 9.sp, fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
