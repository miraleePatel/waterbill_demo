import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/generated/assets.dart';
import '../../Controller/water_bill_customer_controller.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_widget.dart';

class PaidBillDetailScreen extends StatefulWidget {
  const PaidBillDetailScreen({Key? key}) : super(key: key);

  @override
  State<PaidBillDetailScreen> createState() => _PaidBillDetailScreenState();
}

class _PaidBillDetailScreenState extends State<PaidBillDetailScreen> {

  WaterBillCustomerController waterBillCustomerController =
      Get.put(WaterBillCustomerController());
  String houseResidentID = Get.arguments[0];
  String monthId = Get.arguments[1];
  String year = Get.arguments[2];
  String statusID = Get.arguments[3];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callMethodOnInit();

  }

  callMethodOnInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      waterBillCustomerController.getPaymentDetails({
        "HouseResidentID": houseResidentID.toString(),
        "Month": monthId,
        "year": year
      });
      waterBillCustomerController.getPaymentSummary({
        "HouseResidentID": houseResidentID.toString(),
        "Month": monthId,
        "year": year,
        "StatusID": statusID
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    waterBillCustomerController.dueDateFormate = " ";
    // waterBillCustomerController.paymentDate = " ";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        backgroundColor: AppColors.bottomIndiColor,
        title: CustomWidgets.text("เทศบาลดิจิทัล",
            color: AppColors.textWhiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() {
            return waterBillCustomerController
                            .paymentDetails.value.houseResidentID !=
                       null &&
                    waterBillCustomerController.paymentSummaryList.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 1.5.h,
                      ),
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
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: AppColors.paidBoxColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        height: 4.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.assetsBillPaid, scale: 6.2),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomWidgets.text(paid,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textWhiteColor,
                                fontSize: 9.sp),
                          ],
                        ),
                      ),
                      Container(
                        // height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            border: Border.all(color: AppColors.textGreyColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.top,
                                columnWidths: const {
                                  0: FractionColumnWidth(.4),
                                },
                                children: [
                                  /// nameSurname
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
                                  /// telephoneNumber
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
                                  /// waterUserNumber
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
                                  /// monthlyWaterBill
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          monthlyWaterBill,
                                          fontSize: 7.sp),
                                    ),
                                    waterBillCustomerController.paymentDetails.value.monthyear != null ?  Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").first.toString()}"
                                              "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").last.toString()}",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ) : Container(),
                                  ]),
                                  /// amount
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
                                  /// due
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(due,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child:waterBillCustomerController.paymentDetails.value.duedate != null ? CustomWidgets.text(
                                          waterBillCustomerController.dueDateFormate,
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left) :  CustomWidgets.text(
                                          " - ",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left)

                                    ),
                                  ]),
                                  /// overdueInstallments
                                 /* TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          overdueInstallments,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child:waterBillCustomerController.paymentSummaryList.length == 1 ? CustomWidgets.text(
                                          " 0 ${installments2}",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left): CustomWidgets.text(
                                          " ${waterBillCustomerController.paymentSummaryList.length} ${installments2}",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    )
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
                                                      .isNotEmpty ||
                                                  waterBillCustomerController
                                                          .paymentSummaryList[
                                                              index]
                                                          .meterImage ==
                                                      "null"
                                              ? Container(
                                                  height: 15.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .borderGreyColor,
                                                          width: 0.5.w)),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        waterBillCustomerController
                                                            .paymentSummaryList[
                                                                index]
                                                            .meterImage
                                                            .toString(),
                                                    placeholder: (context,
                                                            url) =>
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: AppColors
                                                                  .paidBoxColor,
                                                            )),
                                                    fit: BoxFit.cover,
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
                                          CustomWidgets.text(
                                            "${waterBillCustomerController.paymentSummaryList[index].monthName.toString()} ${waterBillCustomerController.paymentSummaryList[index].year.toString()}",
                                            fontSize: 7.sp,
                                            textAlign: TextAlign.center,
                                          )
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
                            const Divider(
                              color: AppColors.textGreyColor,
                              height: 9,
                              thickness: 1,
                            ),
                            /// paymentSummary
                            Center(
                              child: CustomWidgets.text(paymentSummary,
                                  fontSize: 7.sp,
                                  textAlign: TextAlign.center,
                                  color: AppColors.paidBoxColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Divider(
                              color: AppColors.textGreyColor,
                              height: 9,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Table(
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
                                          CustomWidgets.text(
                                              waterBillCustomerController
                                                  .paymentSummaryList
                                                  .last
                                                  .carriedOver
                                                  .toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
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
                                  ]),
                                ],
                              ),
                            ),
                            const Divider(
                              color: AppColors.textGreyColor,
                              height: 9,
                              thickness: 1,
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomWidgets.text(
                                      total,
                                      fontSize: 7.sp,
                                      textAlign: TextAlign.center,
                                      color: AppColors.paidBoxColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    /* ${waterBillCustomerController.total}*/
                                    CustomWidgets.text(
                                      // " ${waterBillCustomerController.paidTotal!.toPrecision(2)} บาท",
                                      "${waterBillCustomerController.paymentSummaryList.last.carryOver.toString()} บาท",
                                      fontSize: 7.sp,
                                      textAlign: TextAlign.center,
                                      color: AppColors.paidBoxColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              color: AppColors.textGreyColor,
                              height: 9,
                              thickness: 1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10,bottom: 5),
                              child: Table(
                                // defaultVerticalAlignment:
                                // TableCellVerticalAlignment.top,
                                // columnWidths: {
                                //   0: FractionColumnWidth(.1),
                                // },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomWidgets.text(paymentDateandTime,
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                    Padding(
                                          padding: const EdgeInsets.all(3),
                                          child:   waterBillCustomerController
                                              .paymentDetails.value.paymentDate != null && waterBillCustomerController
                                              .paymentDetails.value.paymentDate != ""?
                                         /* CustomWidgets.text(
                                             "${waterBillCustomerController.paymentDate.toString()}  ${ waterBillCustomerController.paymentTime}",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left)*/
                                          CustomWidgets.text(
                                              waterBillCustomerController
                                                  .paymentDetails.value.paymentDate.toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left): CustomWidgets.text(
                                             " - ",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left),
                                        )

                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomWidgets.text(paymentMethod,
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                    waterBillCustomerController
                                            .paymentDetails.value.paymentMethod
                                             == "cash" || waterBillCustomerController
                                        .paymentDetails.value.paymentMethod
                                        == "Cash"
                                        ? Padding(
                                      padding: const EdgeInsets.all(3),
                                          child: CustomWidgets.text(
                                             /* waterBillCustomerController
                                                  .paymentDetails
                                                  .value
                                                  .paymentMethod
                                                  .toString()*/ "เงินสด",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left),
                                        )
                                        : Padding(
                                      padding: const EdgeInsets.all(3),
                                          child: CustomWidgets.text(" - ",
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.left),
                                        ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomWidgets.text(amount,
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomWidgets.text(
                                          waterBillCustomerController
                                              .paymentDetails.value.amountPaid
                                              .toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      /*  Center(
                  child: GestureDetector(
                    onTap: () {
              Get.toNamed(Routes.PRINT_BILL_SCREEN);
                    },
                    child: Container(
                      height: 5.h,
                      width: 50.w,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      decoration: BoxDecoration(
                        color: AppColors.titlebgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidgets.text(
                              downloadReceipt, fontWeight: FontWeight.w600,
                              fontSize: 9.sp),
                          Icon(
                            Icons.download,
                            size: 15.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),*/
                    ],
                  )
                : Container();
          }),
        ),
      ),
    );
  }
}
