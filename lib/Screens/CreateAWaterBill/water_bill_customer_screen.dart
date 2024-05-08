import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Routes/routes.dart';
import '../../Controller/dashboard_controller.dart';
import '../../Controller/main_screen_controller.dart';
import '../../Controller/water_bill_customer_controller.dart';
import '../../Model/login_success_model.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_dropdown_button.dart';
import '../../Widgets/custom_widget.dart';

class WaterBillCustomerScreen extends StatefulWidget {
  const WaterBillCustomerScreen({Key? key}) : super(key: key);

  @override
  State<WaterBillCustomerScreen> createState() =>
      _WaterBillCustomerScreenState();
}

class _WaterBillCustomerScreenState extends State<WaterBillCustomerScreen> {
  WaterBillCustomerController waterBillCustomerController =
      Get.put(WaterBillCustomerController());
  MainScreenController mainScreenController = Get.put(MainScreenController());
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    // waterBillCustomerController. getMonthList();
    callMethodOnInit();
    print("officer id :: ${LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString()}");
    super.initState();

  }
    callMethodOnInit(){
      waterBillCustomerController.serchController.clear();
      waterBillCustomerController.houseSearchString.value = " ";
      WidgetsBinding.instance.addPostFrameCallback((_){
        waterBillCustomerController.getCustomerList(
          OfficerID:LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString(),
          Month:  waterBillCustomerController.monthId,
          Year:waterBillCustomerController.year
        );
        // Add Your Code here.
      });
    }

  @override
  void dispose() {
    // TODO: implement dispose
    waterBillCustomerController.serchController.clear();
    super.dispose();
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Obx(() {
            return
            Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                /// drop down btn
                CustomDropDownButton(
                  value: waterBillCustomerController.custDropValue.value,
                  items: dashboardController.monthYearList
                      .map((item) {
                    return new DropdownMenuItem(
                      child: Center(
                        /*${departmentName}สำหรับเดือน ของ*/
                        child: CustomWidgets.text(
                            " ${item.cYear.toString()}",
                            fontSize: 8.sp),
                      ),
                      value: item.cYear.toString(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    waterBillCustomerController.custDropValue.value =
                        value.toString();
                              waterBillCustomerController.findMonth();
                    waterBillCustomerController.getCustomerList(
                      OfficerID:LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString(),
                      Month: waterBillCustomerController.monthId,
                      Year:waterBillCustomerController.year
                    );
                  },
                ),
                SizedBox(
                  height: 1.h,
                ),
                /// branch name
                Center(
                  child: CustomWidgets.text(
                    /*  samakkhiRuamjaiSubdistrict*/
                    LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].branchName!.toString(),
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),

                /// Search House Number bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 65.w,
                      child: TextFormField(
                        controller: waterBillCustomerController.serchController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          waterBillCustomerController.houseSearchString.value =
                              value.toLowerCase();
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "บ้านเลขที่",
                          contentPadding: const EdgeInsets.all(12),
                          prefixIcon: Icon(
                            Icons.home,
                            color: AppColors.textBlackColor,
                            size: 20.sp,
                          ),
                          hintStyle: TextStyle(
                            fontSize: SizerUtil.deviceType == DeviceType.mobile
                                ? 11.5.sp
                                : 8.5.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.borderGreyColor, width: 0.5.w),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.borderGreyColor, width: 0.5.w),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    /// search btn
                    CustomButton(
                        onTap: () {
                          waterBillCustomerController.filterCustomerList();
                          waterBillCustomerController.isShow.value = true;
                          FocusScope.of(context).unfocus();
                          // waterBillCustomerController.serchController.clear();
                        },
                        height: 5.h,
                        width: 23.w,
                        color: AppColors.titlebgColor,
                        margin: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.search),
                            CustomWidgets.text(
                              "ค้นหา",
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),

                /// Customer Data List
                ///
                SizedBox(
                  height: 60.h,
                  child: waterBillCustomerController.isShow.value &&
                          waterBillCustomerController
                              .houseSearchString.value.isNotEmpty
                      ? searchCustomerList()
                      :allCustomerList()
                ),
                SizedBox(
                  height: 5.h,
                )
              ],
            ) ;
          }),
        ),
      ),
    );
  }




  /// search customer list data
  searchCustomerList() {
    return waterBillCustomerController.searchCustomerList.isNotEmpty
        ? ListView.separated(
      shrinkWrap: true,
      itemCount: waterBillCustomerController.searchCustomerList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Card(
              elevation: 6,
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      /// house nuumber & user water number
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                              "$House_Number "
                                  "${waterBillCustomerController.searchCustomerList[index].houseNo} ",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600),
                          CustomWidgets.text(
                              "$Water_user_number ${waterBillCustomerController.searchCustomerList[index].userWaterNumber}",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    /// cName & statusTextThai
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        Expanded(
                          child: CustomWidgets.text(
                              "${waterBillCustomerController.searchCustomerList[index].cName} ",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        CustomWidgets.text(waterBillCustomerController.searchCustomerList[index].statusID == 0 ?
                        waterBillCustomerController.searchCustomerList[index].statusTextThai! :"สร้างบิลแล้ว",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color:waterBillCustomerController.searchCustomerList[index].statusID == 0 ? AppColors.unpaidBoxColor :
                            AppColors.paidBoxColor)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    /// bill number
                    child: Row(
                      children: [
                        waterBillCustomerController.searchCustomerList[index].billNumber.toString() != "0" ?  CustomWidgets.text(
                            "$Bill_Number "
                                "${waterBillCustomerController.searchCustomerList[index].billNumber} ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600) :  CustomWidgets.text(
                            "$Bill_Number "
                                " - ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  waterBillCustomerController.searchCustomerList[index].statusID == 0
                      ? Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      /// See_Details btn
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              Routes.SEE_CUSTOMERBILL_LIST_SCREEN,arguments:waterBillCustomerController
                              .searchCustomerList[index]);
                        },
                        child: Container(
                            height: 4.h,
                            width:
                            MediaQuery.of(context).size.width /
                                2 -
                                24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.createSeeAllColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10)),
                              // boxShadow: kElevationToShadow[3],
                            ),
                            child: CustomWidgets.text(See_Details,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600)),
                      ),
                      /// create bill button
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              Routes.CREATE_WATER_BILL_SCREEN,arguments:[waterBillCustomerController
                              .searchCustomerList[index],waterBillCustomerController.monthId,
                            waterBillCustomerController.year, waterBillCustomerController.custDropValue.toString()] );
                        },
                        child: Container(
                            height: 4.h,
                            width:
                            MediaQuery.of(context).size.width /
                                2 -
                                24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.unpaidBoxColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10)),
                              // boxShadow: kElevationToShadow[3],
                            ),
                            child: CustomWidgets.text(
                                "สร้างบิลน้ำประปา",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textWhiteColor)),
                      ),
                    ],
                  )
                      :
                  /// see details button
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          Routes.SEE_CUSTOMERBILL_LIST_SCREEN,arguments:waterBillCustomerController
                          .searchCustomerList[index] );

                    },
                    child: Container(
                        height: 4.h,
                        width: MediaQuery.of(context).size.width,
                        // width: 43.9.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.createSeeAllColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          // boxShadow: kElevationToShadow[3],
                        ),
                        child: CustomWidgets.text(
                          "ดูรายละเอียด",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ),
            waterBillCustomerController.searchCustomerList.length - 1 ==
                index
                ? SizedBox(
              height: 3.h,
            )
                : const SizedBox()
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 1.5.h,
        );
      },
    )
        : Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: CustomWidgets.text(
        'ไม่มีข้อมูล',
      ),
    );
  }

  /// all customer list data
  allCustomerList() {
    return waterBillCustomerController.customerList.isNotEmpty
        ? RefreshIndicator(
          onRefresh: () async{
            callMethodOnInit();
            print("Month ::::: ${waterBillCustomerController.monthId}");
            print("Month ::::: ${waterBillCustomerController.year}");
          },
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: waterBillCustomerController.customerList.length,
              itemBuilder: (context, index) {
                // print("::::::${waterBillCustomerController.customerList.length}");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Card(
                      elevation: 6,
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
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomWidgets.text(
                                      "$House_Number "
                                      "${waterBillCustomerController.customerList[index].houseNo} ",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                  CustomWidgets.text(
                                      "$Water_user_number ${waterBillCustomerController.customerList[index].userWaterNumber}",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                const Icon(Icons.person),
                                Expanded(
                                  child: CustomWidgets.text(
                                      "${waterBillCustomerController.customerList[index].cName} ",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                  CustomWidgets.text(waterBillCustomerController.customerList[index].statusID == 0 ?
                                  waterBillCustomerController.customerList[index].statusTextThai! :"สร้างบิลแล้ว",
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600,
                                        color:waterBillCustomerController.customerList[index].statusID == 0 ? AppColors.unpaidBoxColor :
                                        AppColors.paidBoxColor)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                waterBillCustomerController.customerList[index].billNumber.toString() != "0" ?  CustomWidgets.text(
                                    "$Bill_Number "
                                    "${waterBillCustomerController.customerList[index].billNumber} ",
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600) :  CustomWidgets.text(
                                    "$Bill_Number "
                                        " - ",
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          waterBillCustomerController.customerList[index].statusID == 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {

                                            Get.toNamed(
                                            Routes.SEE_CUSTOMERBILL_LIST_SCREEN,arguments:waterBillCustomerController
                                            .customerList[index] );

                                      },
                                      child: Container(
                                          height: 4.h,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                      2 -
                                                  24,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: AppColors.createSeeAllColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10)),
                                            // boxShadow: kElevationToShadow[3],
                                          ),
                                          child: CustomWidgets.text(See_Details,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.CREATE_WATER_BILL_SCREEN,arguments:[waterBillCustomerController
                                            .customerList[index],waterBillCustomerController.monthId,
                                          waterBillCustomerController.year,waterBillCustomerController.custDropValue.toString()] );
                                      },
                                      child: Container(
                                          height: 4.h,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                      2 -
                                                  24,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: AppColors.unpaidBoxColor,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(10)),
                                            // boxShadow: kElevationToShadow[3],
                                          ),
                                          child: CustomWidgets.text(
                                              "สร้างบิลน้ำประปา",
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textWhiteColor)),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        Routes.SEE_CUSTOMERBILL_LIST_SCREEN,arguments:waterBillCustomerController
                                        .customerList[index] );

                                  },
                                  child: Container(
                                      height: 4.h,
                                      width: MediaQuery.of(context).size.width,
                                      // width: 43.9.w,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: AppColors.createSeeAllColor,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        // boxShadow: kElevationToShadow[3],
                                      ),
                                      child: CustomWidgets.text(
                                        "ดูรายละเอียด",
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                        ],
                      ),
                    ),
                    waterBillCustomerController.customerList.length - 1 == index
                        ? SizedBox(
                            height: 3.h,
                          )
                        : const SizedBox()
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1.5.h,
                );
              },
            ),
        )
        : Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: CustomWidgets.text(
              waterBillCustomerController.listStatus.value,
            ),
          );
  }


/*  /// all customer list data
  CustomerListView(List<Customer> cusmList) {
    return cusmList.isNotEmpty
        ? ListView.separated(
      shrinkWrap: true,
      itemCount: cusmList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Card(
              elevation: 6,
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                              "$House_Number "
                                  "${cusmList[index].houseNo} ",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600),
                          CustomWidgets.text(
                              "$Water_user_number ${cusmList[index].userWaterNumber}",
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        CustomWidgets.text(
                            "${cusmList[index].cName} ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600),
                        const Spacer(),
                        (index == 0 || index == 1 || index == 2)
                            ? CustomWidgets.text(have_Not_Create_bill,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.unpaidBoxColor)
                            : CustomWidgets.text(Bill_created,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.paidBoxColor),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CustomWidgets.text(
                            "$Bill_Number "
                                "${cusmList[index].billNumber} ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  (index == 0 || index == 1 || index == 2)
                      ? Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              Routes.SEE_CUSTOMERBILL_LIST_SCREEN,
                              arguments: cusmList[index].houseResidentID
                                  .toString());

                        },
                        child: Container(
                            height: 4.h,
                            width:
                            MediaQuery.of(context).size.width /
                                2 -
                                24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.createSeeAllColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10)),
                              // boxShadow: kElevationToShadow[3],
                            ),
                            child: CustomWidgets.text(See_Details,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const CreateWaterBillScreen()),
                          // );
                          Get.toNamed(
                              Routes.CREATE_WATER_BILL_SCREEN,arguments:cusmList[index] );
                        },
                        child: Container(
                            height: 4.h,
                            width:
                            MediaQuery.of(context).size.width /
                                2 -
                                24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.unpaidBoxColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10)),
                              // boxShadow: kElevationToShadow[3],
                            ),
                            child: CustomWidgets.text(
                                "สร้างบิลน้ำประปา",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textWhiteColor)),
                      ),
                    ],
                  )
                      : GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          Routes.SEE_CUSTOMERBILL_LIST_SCREEN,
                          arguments: cusmList[index].houseResidentID
                              .toString());
                    },
                    child: Container(
                        height: 4.h,
                        width: MediaQuery.of(context).size.width,
                        // width: 43.9.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.createSeeAllColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          // boxShadow: kElevationToShadow[3],
                        ),
                        child: CustomWidgets.text(
                          "ดูรายละเอียด",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ),
            cusmList.length - 1 == index
                ? SizedBox(
              height: 3.h,
            )
                : const SizedBox()
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 1.5.h,
        );
      },
    )
        : Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: CustomWidgets.text(
        'No patient found!',
      ),
    );
  }*/

}
