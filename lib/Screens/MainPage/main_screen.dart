import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Controller/main_screen_controller.dart';
import 'package:water_bill_app/Widgets/custom_widget.dart';
import '../../Controller/dashboard_controller.dart';
import '../../Model/login_success_model.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_dropdown_button.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenController mainScreenController = Get.put(MainScreenController());
  double minValue = 0.0;
  double maxValue = 1.0;
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    // TODO: implement initState
    // mainScreenController.getMonthList();

    callMethodOnInit();
    super.initState();
  }

  callMethodOnInit(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      mainScreenController.getPaymentStatus();
      /// api DBPaymentWiseCustList
      mainScreenController.getDBPaymentWiseCustList({
        "Month": mainScreenController.monthId.toString(),
        "Year": mainScreenController.year,
        "Paymentstatus":
        mainScreenController.billDropValue.value,
        "OfficeID" : LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString()
      });
      /// api Dashboard
      mainScreenController.getDashboard({
        "Month":mainScreenController.monthId,
        "Year":mainScreenController.year,
        "OfficerID":LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString()
      });
      /// api Dashboardcount
      mainScreenController.getDashboardcount({
        "OfficerID":LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString(),
        "Month": mainScreenController.monthId,
        "Year":mainScreenController.year
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bottomIndiColor,
        title: CustomWidgets.text(
          digitalMunicipality,
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
            return mainScreenController.dashboard.value.overdue != null && mainScreenController.dashboardcount.value.totalHouse != null
            && mainScreenController.paymentStatusList.isNotEmpty
            ? Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 3.h,
                ),

                /// drop down btn
                CustomDropDownButton(
                  value:  mainScreenController.mainDropValue.value,
                  items: dashboardController.monthYearList
                      .map((item) {
                    return new DropdownMenuItem(
                      child: Center(
                        /*${departmentName}สำหรับเดือน ของ */
                        child: CustomWidgets.text(
                            "${item.cYear.toString()}",
                            fontSize: 8.sp),
                      ),
                      value: item.cYear.toString(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    mainScreenController.mainDropValue.value = value.toString();
                    if (kDebugMode) {
                      print(
                          "::::::::${mainScreenController.concateMainList.length}");
                    }
                    mainScreenController.findMonth();
                    callMethodOnInit();
                    mainScreenController.dbPaymentWiseCustList.clear();
                  },


                ),

                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.textGreyColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: RefreshIndicator(
                      onRefresh: () async{
                        callMethodOnInit();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Center(
                            child: CustomWidgets.text(
                              /* samakkhiRuamjaiSubdistrict*/
                              LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].branchName!.toString(),
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Center(
                            child: CustomWidgets.text(
                                "${LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].departmentName!.toString()}สำหรับเดือน ของ${mainScreenController.mainDropValue.value}",
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                maxLine: 3,
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          // Center(
                          //   child: CustomWidgets.text(
                          //     "ณ วันที่ ${mainScreenController.mainDropValue.value}",
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 8.sp,
                          //   ),
                          // ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          const Divider(
                            color: AppColors.textGreyColor,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 10,
                                percent: mainScreenController.dashboardcount.value
                                            .billPercentage !=
                                        null
                                    ? double.parse(mainScreenController
                                            .dashboardcount.value.billPercentage
                                            .toString()) /
                                        100
                                    : 0.0,
                                // percent: 0.6,
                                reverse: true,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomWidgets.text(
                                        "${mainScreenController.dashboardcount.value.billPercentage} %",
                                        fontWeight: FontWeight.w600),
                                    CustomWidgets.text(Bill_Created,
                                        fontSize: 8.sp),
                                  ],
                                ),
                                progressColor: AppColors.bottomIndiColor,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: CustomWidgets.text(
                                      theTotalNumberOfBillsGenerated,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomWidgets.text(Bill_created,
                                            fontSize: 8.sp),
                                        CustomWidgets.text(
                                            mainScreenController
                                                .dashboardcount.value.billgenerate != null ?  mainScreenController
                                              .dashboardcount.value.billgenerate
                                              .toString() : " 0 ",
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomWidgets.text(behind,
                                            fontSize: 8.sp),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomWidgets.text(fromAll,
                                            fontSize: 8.sp),
                                        CustomWidgets.text(
                                            mainScreenController.dashboardcount.value.totalHouse != null ?
                                            "     ${mainScreenController.dashboardcount.value.totalHouse.toString()}" : " 0 ",
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomWidgets.text(behind,
                                            fontSize: 8.sp),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          ///****************** 474 Built Bills *********************
                          CustomWidgets.text("บิลที่สร้างแล้ว ${mainScreenController
                              .dashboardcount.value.billgenerate
                              .toString()} หลัง",
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statusContainer(
                                color: AppColors.paidBoxColor,
                                text1: paid,
                                text2: mainScreenController.dashboard.value.paid != " " && mainScreenController.dashboard.value.paid != null ? mainScreenController.dashboard.value.paid
                                    .toString() : "0",
                              ),
                              statusContainer(
                                color: AppColors.unpaidBoxColor,
                                text1: unpaid,
                                text2: mainScreenController.dashboard.value.unPaid != " " && mainScreenController.dashboard.value.unPaid != null ? mainScreenController.dashboard.value.unPaid
                                    .toString() : "0",
                              ),
                              statusContainer(
                                color: AppColors.overdueBoxColor,
                                text1: overdue,
                                text2:mainScreenController.dashboard.value.overdue != " " && mainScreenController.dashboard.value.overdue != null? mainScreenController
                                    .dashboard.value.overdue
                                    .toString() : "0",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ///*********************   All Bill Details **************************
                          CustomWidgets.text(allBillDetails,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 1.h,
                          ),

                          /// paid drop btn
                          CustomDropDownButton(
                            value: mainScreenController.billDropValue.value,
                            items: mainScreenController.paymentStatusList
                                .map((item) {
                              return new DropdownMenuItem(
                                child: Center(
                                  child: CustomWidgets.text(
                                      item.statusTextThai.toString(),
                                      fontSize: 9.sp),
                                ),
                                value: item.statusID.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              mainScreenController.billDropValue.value =
                                  value as String;
                              mainScreenController.getDBPaymentWiseCustList({
                                "Month": mainScreenController.monthId.toString(),
                                "Year": mainScreenController.year,
                                "Paymentstatus":
                                mainScreenController.billDropValue.value,
                                "OfficeID" : LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString()
                              });

                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                               Expanded(
                                  child:mainScreenController.dbPaymentWiseCustList.isNotEmpty ?
                                  ListView.separated(
                                    itemCount: mainScreenController.dbPaymentWiseCustList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var custList =  mainScreenController.dbPaymentWiseCustList[index];
                                      return
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    color: AppColors.titlebgColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  height: 5.h,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CustomWidgets.text(
                                                            "$House_Number "
                                                                "${custList.houseNo} ",
                                                            fontSize: 8.sp,
                                                            fontWeight: FontWeight.w600),

                                                        CustomWidgets.text(
                                                            "$Water_user_number ${custList
                                                                .userWaterNumber}",
                                                            fontSize: 8.sp,
                                                            fontWeight: FontWeight.w600),
                                                      /*  CustomWidgets.text(
                                                            "$House_Number 127 43",
                                                            fontSize: 8.sp,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                        CustomWidgets.text(
                                                            "$Water_user_number 0003",
                                                            fontSize: 8.sp,
                                                            fontWeight:
                                                                FontWeight.w600),*/
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.person),
                                                      Expanded(
                                                        child: CustomWidgets.text(
                                                            "${custList.cName} ",
                                                            fontSize: 8.sp,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                     /* CustomWidgets.text(
                                                          Somying_Cherdchoo,
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600),*/
                                                      const Spacer(),
                                                      CustomWidgets.text(
                                                          custList.statusTextThai.toString(),
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:custList.statusTextThai == "ชำระแล้ว" ? (AppColors
                                                              .paidBoxColor) : custList.statusTextThai == "ค้างชำระ"?
                                                          AppColors
                                                              .overdueBoxColor :
                                                          custList.statusTextThai == "ยกยอด"?
                                                          AppColors.unpaidBoxColor:
                                                          AppColors.unpaidBoxColor
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20),
                                                  child: Row(
                                                    children: [
                                                      CustomWidgets.text(
                                                          "$Bill_Number  ${custList.billNumber}",
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                const Divider(
                                                  color: AppColors.textGreyColor,
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    custList.statusTextThai == "ยังไม่ชำระ" ?
                                                    Get.toNamed(
                                                        Routes
                                                            .OVERDUE_BILL_DETAILS_SCREEN,
                                                        arguments: [
                                                          custList.houseResidentID.toString(),
                                                          mainScreenController.monthId.toString(),
                                                          mainScreenController.year.toString(),
                                                        ]) :
                                                    custList.statusTextThai == "ยกยอด"?
                                                    Get.toNamed(
                                                        Routes
                                                            .CARRY_BILL_DETAILS_SCREEN,
                                                        arguments: [
                                                          custList.houseResidentID.toString(),
                                                          mainScreenController.monthId.toString(),
                                                          mainScreenController.year.toString(),
                                                          custList.statusID
                                                        ]) :
                                                    custList.statusTextThai == "ค้างชำระ"?
                                                    Get.toNamed(
                                                        Routes
                                                            .OVERDUE_BILL_DETAILS_SCREEN,
                                                        arguments: [
                                                          custList.houseResidentID.toString(),
                                                          mainScreenController.monthId.toString(),
                                                          mainScreenController.year.toString(),
                                                        ])
                                                            :
                                                    Get.toNamed(
                                                        Routes
                                                            .PAID_BILL_DETAILS_SCREEN,
                                                        arguments: [
                                                          custList.houseResidentID.toString(),
                                                          mainScreenController.monthId.toString(),
                                                          mainScreenController.year.toString(),
                                                          custList.statusID

                                                        ]);

                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      CustomWidgets.text(
                                                          See_Details,
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_outlined,
                                                        size: 13.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );

                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                  ) :
                                  Center(
                                      child: CustomWidgets.text(
                                        'ไม่มีข้อมูล',
                                      )),
                                ),

                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ) : Container();
          }),
        ),
      ),
    );
  }
}

class statusContainer extends StatelessWidget {
  final Color? color;
  final String? text1;
  final String? text2;
  const statusContainer({super.key, this.color, this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 27.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomWidgets.text(
            text1!,
            color: AppColors.textWhiteColor,
            fontWeight: FontWeight.w400,
          ),
          CustomWidgets.text(
            text2!,
            color: AppColors.textWhiteColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
