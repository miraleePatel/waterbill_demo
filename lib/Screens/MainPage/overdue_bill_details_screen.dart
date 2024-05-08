// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Controller/water_bill_customer_controller.dart';
import '../../Controller/bill_detail_controller.dart';
import '../../Model/login_success_model.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_textformfield.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class OverdueBillDetailsScreen extends StatefulWidget {
  const OverdueBillDetailsScreen({Key? key}) : super(key: key);
  @override
  State<OverdueBillDetailsScreen> createState() =>
      _OverdueBillDetailsScreenState();
}

class _OverdueBillDetailsScreenState extends State<OverdueBillDetailsScreen> {
  WaterBillCustomerController waterBillCustomerController = Get.find();
  BillDetailController billDetailController = Get.put(BillDetailController());
  String houseResidentID = Get.arguments[0];
  String monthId = Get.arguments[1];
  String year = Get.arguments[2];

  void initState() {
    // TODO: implement initState
    super.initState();
    callMethodOnInit();

  }
  callMethodOnInit(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      waterBillCustomerController.getPaymentDetails({
        "HouseResidentID":houseResidentID
            .toString(),
        "Month": monthId,
        "year": year
      });
      waterBillCustomerController.getBillSummary(houseResidentID.toString());
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
            return waterBillCustomerController.paymentDetails.value.duedate != null &&  waterBillCustomerController.billSummaryList.isNotEmpty
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
                        decoration: BoxDecoration(
                          color: AppColors.overdueBoxColor,
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
                              waitingForPayment,
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
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(nameSurname,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterBillCustomerController.paymentDetails.value.username
                                              .toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),
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
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(waterUserNumber,
                                          fontSize: 7.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterBillCustomerController.paymentDetails.value.userWaterNumber.toString(),
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          monthlyWaterBill,
                                          fontSize: 7.sp),
                                    ),
                                    waterBillCustomerController.paymentDetails.value.monthyear != null ? Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").first.toString()}"
                                              "${waterBillCustomerController.paymentDetails.value.monthyear!.split("-").last.toString()}",
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ):Container(),
                                  ]),
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
                                          textAlign: TextAlign.left) : Container()
                                    ),
                                  ]),
                                /*  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          overdueInstallments,
                                          fontSize: 7.sp),
                                    ),
                                    waterBillCustomerController
                                            .billSummaryList.isNotEmpty
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: CustomWidgets.text(waterBillCustomerController.billSummaryList.length == 1 ?
                                            " 0 ${installments2}":
                                                " ${waterBillCustomerController.billSummaryList.length} ${installments2}",
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
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: CustomWidgets.text(
                                          waterMeterPicture,
                                          fontSize: 7.sp,
                                          textAlign: TextAlign.left),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(),
                                    )
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
                                        .billSummaryList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                      waterBillCustomerController
                                          .billSummaryList[index]
                                          .meterImage!
                                              .isNotEmpty
                                          ? Container(
                                              height: 15.h,
                                              width: 28.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.borderGreyColor, width: 0.5.w)
                                          ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                waterBillCustomerController
                                                    .billSummaryList[
                                                index]
                                                    .meterImage
                                                    .toString(),
                                                placeholder: (context, url) =>Container(
                                                    alignment: Alignment.center,
                                                    child: CircularProgressIndicator(color: AppColors.overdueBoxColor,)),
                                                fit: BoxFit.cover,
                                              )): Container(
                                      height: 15.h,
                                      width: 28.w,
                                      decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.borderGreyColor, width: 0.5.w)
                                      ),
                                      ),
                                          waterBillCustomerController
                                                  .billSummaryList.isNotEmpty
                                              ? CustomWidgets.text(
                                                  "${waterBillCustomerController.billSummaryList[index].monthName.toString()} ${waterBillCustomerController.billSummaryList[index].year.toString()}",
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
                            Center(
                              child: CustomWidgets.text(
                                paymentSummary,
                                fontSize: 7.sp,
                                textAlign: TextAlign.center,
                                color: AppColors.overdueBoxColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: AppColors.textGreyColor,
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Table(
                                // ignore: prefer_const_literals_to_create_immutables
                                columnWidths: {
                                  5: FractionColumnWidth(10),
                                },
                                children: [
                                  TableRow(
                                      children: [
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
                                      .billSummaryList.length  != 1 ?
                                  TableRow(children: [
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
                                            .billSummaryList.isNotEmpty
                                        ? CustomWidgets.text(
                                            waterBillCustomerController
                                                .billSummaryList.last.carriedOver
                                                .toString(),
                                            fontSize: 7.sp,
                                            textAlign: TextAlign.center)
                                        : Container(),
                                  ]) : TableRow(children: [
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
                                                  .billSummaryList
                                                  .last
                                                  .monthName
                                                  .toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text(
                                              waterBillCustomerController
                                                  .billSummaryList
                                                  .last
                                                  .previousWaterUnit
                                                  .toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text(
                                              waterBillCustomerController
                                                  .billSummaryList
                                                  .last
                                                  .waterUnit
                                                  .toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text(
                                              waterBillCustomerController
                                                  .billSummaryList.last.usedUnit
                                                  .toString(),
                                              fontSize: 7.sp,
                                              textAlign: TextAlign.center),
                                          CustomWidgets.text(
                                              "${waterBillCustomerController.billSummaryList.last.paymentAmount.toString()} บาท",
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
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomWidgets.text(total,
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center,
                                        color: AppColors.overdueBoxColor,
                                        fontWeight: FontWeight.w700),
                                    CustomWidgets.text(
                                        "${waterBillCustomerController.billSummaryList.last.carryOver.toString()} บาท",
                                        fontSize: 7.sp,
                                        textAlign: TextAlign.center,
                                        color: AppColors.overdueBoxColor,
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
                      GestureDetector(
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
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Container(
                      ),
                    ),
                  );
          }),
        ),
      ),
    );
  }

  void _showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomWidgets.text(
                        "ชำระเงินสด",
                        fontWeight: FontWeight.w600,
                        fontSize: 9.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                        Get.back();
                        },
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomWidgets.text(
                      "ระบุจำนวนเงิน (บาท)",
                      fontWeight: FontWeight.w600,
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: 5.h,
                      child: CustomTextFormField(
                        obscureText: false,
                        borderRadius: BorderRadius.circular(8),
                        controller:
                            waterBillCustomerController.cashPayController,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () {
                      billDetailController.cashBillPay(
                         /* houseResidentID: houseResidentID
                              .toString(), */
                          houseResidentID: waterBillCustomerController.paymentDetails.value.houseResidentID.toString(),
                          AmountPaid: waterBillCustomerController
                              .cashPayController.text,
                          PaymentMethod: "cash",
                          UpdateBy:  LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString());
                      waterBillCustomerController.cashPayController.clear();
                      Get.toNamed(Routes.DASHBOARD_SCREEN);
                    },
                    child: Container(
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.titlebgColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: CustomWidgets.text(
                        "บันทึก",
                        fontWeight: FontWeight.w600,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

///due is static
