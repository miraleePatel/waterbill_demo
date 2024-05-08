import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/bill_detail_controller.dart';
import '../../Controller/water_bill_customer_controller.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class CarryBillDetailsScreen extends StatefulWidget {
  const CarryBillDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CarryBillDetailsScreen> createState() => _CarryBillDetailsScreenState();
}

class _CarryBillDetailsScreenState extends State<CarryBillDetailsScreen> {
  WaterBillCustomerController waterBillCustomerController = Get.find();
  BillDetailController billDetailController = Get.put(BillDetailController());
  String houseResidentID = Get.arguments[0];
  String monthId = Get.arguments[1];
  String year = Get.arguments[2];
  String statusID = Get.arguments[3];

  void initState() {
    // TODO: implement initState
    super.initState();
    callMethodOnInit();

  }

  callMethodOnInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// payment detail api
      waterBillCustomerController.getPaymentDetails({
        "HouseResidentID": houseResidentID.toString(),
        "Month": monthId,
        "year": year
      });
      // /// bill summary api
      // waterBillCustomerController.getBillSummary(houseResidentID.toString());
      waterBillCustomerController.getPaymentSummary({
        "HouseResidentID": houseResidentID.toString(),
        "Month": monthId,
        "year": year,
        "StatusID": statusID
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bottomIndiColor,
        title: CustomWidgets.text(
          "เทศบาลดิจิทัล",
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() {
            return waterBillCustomerController.paymentSummaryList.isNotEmpty &&
                    waterBillCustomerController.paymentDetails.value.duedate !=
                    null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 1.5.h,
                      ),

                      /// bill details text
                      Center(
                        child: CustomWidgets.text(
                          Bill_Details,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      /// carry
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.unpaidBoxColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        height: 4.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.assetsAlarm, scale: 1.5),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomWidgets.text(
                              " ยกยอด ",
                              fontWeight: FontWeight.w600,
                              color: AppColors.textWhiteColor,
                              fontSize: 9.sp,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 470,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          border: Border.all(color: AppColors.textGreyColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.top,
                                // ignore: prefer_const_literals_to_create_immutables
                                columnWidths: {
                                  0: FractionColumnWidth(.4),
                                },
                                children: [
                                  /// name surname
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(nameSurname,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterBillCustomerController
                                              .paymentDetails.value.username
                                              .toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),

                                  /// address
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(address,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child:  waterBillCustomerController.paymentDetails.value.address != "" ?CustomWidgets.text(
                                          waterBillCustomerController.paymentDetails.value.address
                                              .toString(),
                                          fontSize: 7.sp,
                                          maxLine: 3):CustomWidgets.text(
                                          " - ",
                                          fontSize: 7.sp,
                                          maxLine: 3),
                                    ),
                                  ]),

                                  /// phoneNumber
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(telephoneNumber,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child:   waterBillCustomerController
                                          .paymentDetails.value.phoneNumber != 0 ? CustomWidgets.text(
                                          waterBillCustomerController
                                              .paymentDetails.value.phoneNumber
                                              .toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left) : CustomWidgets.text(
                                          " - ",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),

                                  /// userWaterNumber
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(waterUserNumber,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterBillCustomerController
                                              .paymentDetails
                                              .value
                                              .userWaterNumber
                                              .toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),

                                  /// monthyear
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          monthlyWaterBill,
                                          fontSize: 7.sp),
                                    ),
                                    waterBillCustomerController.paymentDetails
                                                .value.monthyear !=
                                            null
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: CustomWidgets.text(
                                                "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").first.toString()}"
                                                "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").last.toString()}",
                                                fontSize: 7.sp,
                                                textAlign: TextAlign.left),
                                          )
                                        : Container(),
                                  ]),

                                  /// paymentAmount
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(amount,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          "${waterBillCustomerController.paymentDetails.value.paymentAmount} บาท",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),

                                  /// duedate
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(due,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: waterBillCustomerController.paymentDetails.value.duedate != null ? CustomWidgets.text(
                                            waterBillCustomerController.dueDateFormate,
                                            fontSize: 7.sp,
                                            textAlign: TextAlign.left) : Container()),
                                  ]),
                                  /// overdueInstallments
                                 /* TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          overdueInstallments,
                                          fontSize: 7.sp),
                                    ),
                                    waterBillCustomerController
                                            .paymentSummaryList.isNotEmpty
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: CustomWidgets.text(
                                                " ${waterBillCustomerController.paymentSummaryList.length} ${installments2}",
                                                fontSize: 7.sp,
                                                textAlign: TextAlign.left),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: CustomWidgets.text(
                                                " ${installments2}",
                                                fontSize: 7.sp,
                                                textAlign: TextAlign.left),
                                          ),
                                  ]),*/
                                  /// waterMeterPicture
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterMeterPicture,
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                    Container()
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: 20.h,
                                alignment: Alignment.center,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: waterBillCustomerController
                                        .paymentSummaryList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          waterBillCustomerController
                                                  .paymentSummaryList[index]
                                                  .meterImage!
                                                  .isNotEmpty
                                              ? Container(
                                                  height: 15.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .borderGreyColor,
                                                          width: 0.5.w)),
                                                  child: Image.network(
                                                    waterBillCustomerController
                                                        .paymentSummaryList[index]
                                                        .meterImage
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                  ))
                                              : Container(
                                                  height: 15.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .borderGreyColor,
                                                          width: 0.5.w)),
                                                ),
                                          waterBillCustomerController
                                                  .paymentSummaryList.isNotEmpty
                                              ? CustomWidgets.text(
                                                  "${waterBillCustomerController.paymentSummaryList[index].monthName.toString()} ${waterBillCustomerController.paymentSummaryList[index].year.toString()}",
                                                  fontSize: 7.sp,
                                                  textAlign: TextAlign.center,
                                                )
                                              : Container(),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 3.w,
                                      );
                                    }),
                              ),
                            ),
                            Divider(
                              color: AppColors.textGreyColor,
                              height: 10,
                              thickness: 1,
                            ),
                            /// paymentSummary text
                            Center(
                              child: CustomWidgets.text(
                                paymentSummary,
                                fontSize: 7.sp,
                                textAlign: TextAlign.center,
                                color: AppColors.unpaidBoxColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: AppColors.textGreyColor,
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Table(
                                // ignore: prefer_const_literals_to_create_immutables
                                columnWidths: {
                                  5: FractionColumnWidth(0.1),
                                },
                                children: [
                                  TableRow(children: [
                                    CustomWidgets.text(month,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(previousMonthUnit,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(unitThisMonth,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(numberOfUnitsUsed,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(amount,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                  ]),

                                  /// carriedOver
                                  waterBillCustomerController
                                              .paymentSummaryList.length !=
                                          1
                                      ? TableRow(children: [
                                          CustomWidgets.text(carry,
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text("-",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text("-",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text("-",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          waterBillCustomerController
                                                  .paymentSummaryList.isNotEmpty
                                              ? CustomWidgets.text(
                                                  waterBillCustomerController
                                                      .paymentSummaryList
                                                      .last
                                                      .carriedOver
                                                      .toString(),
                                                  fontSize: 7.sp,
                                                  textAlign: TextAlign.center)
                                              : Container(),
                                        ])
                                      : TableRow(children: [
                                          Container(
                                            margin: EdgeInsets.all(3),
                                          ),
                                          Container(),
                                          Container(),
                                          Container(),
                                          Container(),
                                        ]),
                                  TableRow(children: [
                                    CustomWidgets.text(
                                        waterBillCustomerController
                                            .paymentSummaryList.last.monthName
                                            .toString(),
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(
                                        waterBillCustomerController
                                            .paymentSummaryList
                                            .last
                                            .previousWaterUnit
                                            .toString(),
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(
                                        waterBillCustomerController
                                            .paymentSummaryList.last.waterUnit
                                            .toString(),
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(
                                        waterBillCustomerController
                                            .paymentSummaryList.last.usedUnit
                                            .toString(),
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                    CustomWidgets.text(
                                        "${waterBillCustomerController.paymentSummaryList.last.paymentAmount.toString()} บาท",
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center),
                                  ])
                                ],
                              ),
                            ),
                            Divider(
                              color: AppColors.textGreyColor,
                              height: 4,
                              thickness: 1,
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 11),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomWidgets.text(total,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center,
                                        color: AppColors.unpaidBoxColor,
                                        fontWeight: FontWeight.w700),
                                    CustomWidgets.text(
                                        "${waterBillCustomerController.paymentSummaryList.last.carryOver.toString()} บาท",
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center,
                                        color: AppColors.unpaidBoxColor,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      /*    GestureDetector(
                  onTap: () {
                    _showAlert();
                  },
                  child: Container(
                    height: 5.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                        color: AppColors.loginBtnColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomWidgets.text(cashPayment,
                        fontWeight: FontWeight.w600,
                        fontSize: 9.sp,
                        color: AppColors.textWhiteColor),
                  ),
                ),*/
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Container(),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
