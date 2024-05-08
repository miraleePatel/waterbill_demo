import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Model/customer_list_model.dart';
import '../../Controller/dashboard_controller.dart';
import '../../Controller/water_bill_customer_controller.dart';
import '../../Model/login_success_model.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_widget.dart';


class SeeCustomerBillListScreen extends StatefulWidget {
  const SeeCustomerBillListScreen({Key? key}) : super(key: key);

  @override
  State<SeeCustomerBillListScreen> createState() =>
      _SeeCustomerBillListScreenState();
}

class _SeeCustomerBillListScreenState extends State<SeeCustomerBillListScreen> {
  WaterBillCustomerController waterBillCustomerController =
      Get.put(WaterBillCustomerController());
  DashboardController dashboardController = Get.find();
  Customer customerList = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      waterBillCustomerController
          .getCustomerBillList(customerList.houseResidentID.toString());
      // Add Your Code here.
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bottomIndiColor,
        title: CustomWidgets.text("เทศบาลดิจิทัล",
            color: AppColors.textWhiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Obx(() {
            return RefreshIndicator(
              onRefresh: () async{
                waterBillCustomerController
                    .getCustomerBillList(customerList.houseResidentID.toString());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  /// branch name
                  Center(
                    child: CustomWidgets.text(
                      /*samakkhiRuamjaiSubdistrict*/
                      LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].branchName!.toString(),
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  /// house number
                  Center(
                    child: CustomWidgets.text(
                      "$House_Number  ${customerList.houseNo.toString()}",
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  /// Customer  bill List
                  Container(
                    // height: 70.h,
                    constraints: BoxConstraints.expand(
                      height: 75.h,
                    ),
                    width: double.infinity,
                    child: waterBillCustomerController.customerBillList.isNotEmpty
                        ? ListView.separated(
                      // reverse: true,
                            itemCount: (waterBillCustomerController
                                    .customerBillList.isNotEmpty)
                                ? waterBillCustomerController
                                    .customerBillList.length
                                : 0,
                            // itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var billList = waterBillCustomerController
                                  .customerBillList[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: AppColors.titlebgColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  topLeft: Radius.circular(10))),
                                          height: 5.h,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                /// water user number
                                                RichText(
                                                  text: TextSpan(
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: waterUserNumber,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .textBlackColor),
                                                      ),
                                                      TextSpan(
                                                        text: billList
                                                            .userWaterNumber,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color: AppColors
                                                                .textBlackColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                /// house number
                                                CustomWidgets.text(
                                                    "$House_Number "
                                                    "${billList.houseNo}",
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w700),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              /// waterSupplyBillForTheMonthOf
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          waterSupplyBillForTheMonthOf,
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .textBlackColor),
                                                    ),
                                                    TextSpan(
                                                      text: "${billList.monthyear!.split("-").first}${billList.monthyear!.split("-").last}",
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .textBlackColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              /// statusTextThai
                                              CustomWidgets.text(
                                                  "${billList.statusTextThai}",
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: billList.statusID == 1 ||
                                                          billList.statusID == 2
                                                      ? AppColors.unpaidBoxColor
                                                      : billList.statusID == 3
                                                          ? AppColors
                                                              .overdueBoxColor
                                                          : AppColors
                                                              .paidBoxColor)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        /// usedUnit
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomWidgets.text(
                                                "$numberOfUnitsUsed  ${billList.usedUnit}",
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              /// paymentAmount
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: amount,
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .textBlackColor),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${billList.paymentAmount} บาท",
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .textBlackColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          /// brought forward (carriedOver)
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomWidgets.text(
                                                "ยอดยกมา",
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              billList.carriedOver != " " ?  CustomWidgets.text(
                                                "${billList.carriedOver}",
                                                fontSize: 7.sp,
                                              ) : CustomWidgets.text(" 0 ",
                                                fontSize: 7.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        ///carryOver
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomWidgets.text(
                                                totalPayment,
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomWidgets.text(
                                                '${billList.carryOver} บาท',
                                                fontSize: 7.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var getMonth =
                                                waterBillCustomerController.customerBillList[index].monthyear!.split("-").first.split(" ").first;
                                            var getYear = waterBillCustomerController.customerBillList[index].monthyear!.split("-").last.split(" ").last;
                                            int? monthId;
                                            String? year;
                                            for (var element in dashboardController.monthYearList) {
                                              if (element.cYear!.split(" ").last == getYear) {
                                                year = element.name!.split(" ").last.toString();
                                              }
                                            }
                                            for (var element in dashboardController.monthYearList) {
                                              if (element.cYear!.split(" ").first == getMonth) {
                                                monthId = element.cMonth;
                                              }
                                            }
                                            // log(" getMonth :::::::: $getMonth");
                                            // log(" getYear :::::::: $getYear");
                                            log(" year id :::::::: $year");
                                            log(" Month id :::::::: $monthId");
                                            /// ( status == 1 & 3(unpaid&Overdue) to navigate a OVERDUE_BILL_DETAILS_SCREEN)
                                            /// ( status == 2(carry) to navigate a CARRY_BILL_DETAILS_SCREEN)
                                            /// ( status == 4(Paid) to navigate a PAID_BILL_DETAILS_SCREEN)
                                            ///
                                            waterBillCustomerController
                                                            .customerBillList[
                                                                index]
                                                            .statusID ==
                                                        1 ||
                                                    waterBillCustomerController
                                                            .customerBillList[
                                                                index]
                                                            .statusID ==
                                                        3?  Get.toNamed(
                                                Routes.OVERDUE_BILL_DETAILS_SCREEN,
                                                arguments: [waterBillCustomerController.customerBillList[index].houseResidentID.toString(),monthId.toString(), year.toString()
                                                ]):waterBillCustomerController
                                                .customerBillList[
                                            index]
                                                .statusID ==
                                                2
                                                ? Get.toNamed(
                                                    Routes.CARRY_BILL_DETAILS_SCREEN,
                                                    arguments: [waterBillCustomerController.customerBillList[index].houseResidentID.toString(), monthId.toString(), year.toString(),waterBillCustomerController.customerBillList[index].statusID.toString()])
                                                    :
                                            Get.toNamed(
                                                Routes.PAID_BILL_DETAILS_SCREEN,
                                                arguments: [waterBillCustomerController.customerBillList[index].houseResidentID.toString(),
                                                  monthId.toString(), year.toString(),waterBillCustomerController.customerBillList[index].statusID.toString()
                                                ]);
                                          },
                                          child: Container(
                                              height: 4.h,
                                              width: double.infinity,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  color:
                                                      AppColors.createSeeAllColor,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomWidgets.text(See_Details,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 15,
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  waterBillCustomerController
                                                  .customerBillList.length -
                                              1 ==
                                          index
                                      ? SizedBox(
                                          height: 3.h,
                                        )
                                      : const SizedBox(),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 1.h,
                              );
                            },
                          )
                        : Container()
                  ),

                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}



/// overdueInstallments(if status is equal to 3(overdue) to show caryycount otherwise overdueInstallments show a " - ")
// Padding(
// padding: const EdgeInsets.only(
// left: 10, right: 10),
//
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// CustomWidgets.text(
// overdueInstallments,
// fontSize: 7.sp,
// fontWeight: FontWeight.w700,
// ),
// billList.statusID == 3 ?  CustomWidgets.text(
// "${billList.carrycount}",
// fontSize: 7.sp,
// ) : CustomWidgets.text(" - ",
// fontSize: 7.sp,
// ),
// ],
// ),
// ),