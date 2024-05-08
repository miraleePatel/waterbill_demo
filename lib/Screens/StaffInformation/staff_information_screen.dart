// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Controller/staff_information_controller.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_widget.dart';

class StaffInformationScreen extends StatefulWidget {
  const StaffInformationScreen({Key? key}) : super(key: key);

  @override
  State<StaffInformationScreen> createState() => _StaffInformationScreenState();
}

class _StaffInformationScreenState extends State<StaffInformationScreen> {
  StaffInformationController staffInformationController =
      Get.put(StaffInformationController());
  @override
  void initState() {
    super.initState();
    staffInformationController.getStaffInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bottomIndiColor,
          title: CustomWidgets.text(digitalMunicipality,
              color: AppColors.textWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp),
          centerTitle: true,
        ),
        body: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: staffInformationController.staffInfo.value.officerID != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),

                      /// staff Information text
                      Center(
                          child: CustomWidgets.text(staffInformation,
                              fontWeight: FontWeight.w700, fontSize: 13.sp)),
                      SizedBox(
                        height: 2.h,
                      ),

                      /// person icon
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.titlebgColor,
                        child: Icon(
                          Icons.person,
                          size: 40.sp,
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      /// id number officerNo
                      Center(
                          child: CustomWidgets.text(
                        "$idNumber${staffInformationController.staffInfo.value.officerNo.toString()}",
                      )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),

                      /// officerFirstName
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              name,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.officerFirstName
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// officerLastName
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Surname,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.officerLastName
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// gender
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Sex,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.gender
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// position
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Position,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.position
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// municipality
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Municipality,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.municipality
                                    .toString(),
                                fontWeight: FontWeight.w600,
                                maxLine: 2,
                                textAlign: TextAlign.end),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// agency (departmentName)
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Agency,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.departmentName
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      /// phoneNumber
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              Telephone_Number,
                            ),
                            CustomWidgets.text(
                                staffInformationController
                                    .staffInfo.value.phoneNumber
                                    .toString(),
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.textGreyColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      /// Logout button
                      CustomButton(
                        onTap: () {
                          GetStorage().erase();
                          // Navigator.of(context, rootNavigator: true).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen(),
                          //   ),
                          // );
                          Get.offAllNamed(Routes.LOGIN_SCREEN);
                        },
                        color: AppColors.titlebgColor,
                        child: CustomWidgets.text("ออกจากระบบ",
                            color: AppColors.textBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  )
                : Container(),
          ),
        ));
  }
}
