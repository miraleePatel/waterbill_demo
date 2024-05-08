import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';
import 'package:water_bill_app/Controller/dashboard_controller.dart';
import '../../Api/dio_api_manager.dart';
import '../../Controller/water_bill_customer_controller.dart';
import '../../Model/customer_list_model.dart';
import '../../Model/login_success_model.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_color.dart';
import '../../Utils/constants.dart';
import '../../Utils/permission_service.dart';
import '../../Utils/string_constant.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textformfield.dart';
import '../../Widgets/custom_widget.dart';
import 'package:http/http.dart' as http;

class CreateWaterBillScreen extends StatefulWidget {
  const CreateWaterBillScreen({Key? key}) : super(key: key);

  @override
  State<CreateWaterBillScreen> createState() => _CreateWaterBillScreenState();
}

class _CreateWaterBillScreenState extends State<CreateWaterBillScreen> {
  WaterBillCustomerController waterBillCustomerController = Get.find();
  DashboardController dashboardController = Get.find();
  Customer customerBill = Get.arguments[0];
  String monthId = Get.arguments[1];
  String year = Get.arguments[2];
  String monthName = Get.arguments[3];
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callMethodOnInit();
    waterBillCustomerController.discountController.text = "0.00";
    waterBillCustomerController.meterMaintenanceFeeController.text = "0.00";
  }

  callMethodOnInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (customerBill.houseResidentID != null) {
        /// customer details Api
        waterBillCustomerController.getCustomerDetails(
            HouseResidentID: customerBill.houseResidentID.toString(),
            Month: monthId,
            year: year);
      } else {
        print("Error");
      }
      waterBillCustomerController.previousMonthUnitController.text =
          waterBillCustomerController.cutomerDetiail.value.previousMonthunit
              .toString();
      // Add Your Code here.
    });
    print("houseResidentID :::: ${customerBill.houseResidentID}");

    print(":::::::: monthId  ${monthId}");
    print(":::::::: year ${year}");
    print(":::::::: monthYearName ${monthName}");
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

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Obx(() {
            var custDestails = waterBillCustomerController.cutomerDetiail.value;
            return custDestails.userWaterNumber != null ||
                    custDestails.houseResidentID != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.5.h,
                      ),

                      /// create water bill text
                      Center(
                        child: CustomWidgets.text(
                          "สร้างบิลน้ำประปา",
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// *************** houseNo ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("เลขที่บ้าน : ",
                                    fontSize: 8.sp),
                                CustomWidgets.text(
                                    custDestails.houseNo.toString(),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** address ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("$address : ",
                                    fontSize: 8.sp),
                                Expanded(
                                  flex: 4,
                                  child: custDestails.cAddress != ""
                                      ? CustomWidgets.text(
                                          custDestails.cAddress.toString(),
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600,
                                          maxLine: 3,
                                          textAlign: TextAlign.right)
                                      : CustomWidgets.text(" - ",
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600,
                                          maxLine: 3,
                                          textAlign: TextAlign.right),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** waterUserNumber ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("$waterUserNumber : ",
                                    fontSize: 8.sp),
                                CustomWidgets.text(
                                    custDestails.userWaterNumber.toString(),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** name ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("$name : ", fontSize: 8.sp),
                                CustomWidgets.text(
                                    custDestails.cName.toString(),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** monthlyWaterSuplyfee ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("$monthlyWaterSuplyfee : ",
                                    fontSize: 8.sp),
                                CustomWidgets.text(monthName,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** previousMonthunit ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("$previousMonthUnit : ",
                                    fontSize: 8.sp),
                                CustomWidgets.text(
                                  custDestails.previousMonthunit.toString(),
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),

                            /*            SizedBox(
                        height: 5.h,
                        child: CustomTextFormField(
                          obscureText: false,
                          borderRadius: BorderRadius.circular(10),
                          controller: waterBillCustomerController
                              .previousMonthUnitController,
                          textAlign: TextAlign.center,
                        ),
                      ),*/
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomWidgets.text("$unitsThisMonth :",
                                fontSize: 8.sp),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            // unitContainer(text: "287"),
                            /// *************** waterUnit texfeild ***************
                            SizedBox(
                              height: 5.h,
                              child: CustomTextFormField(
                                obscureText: false,
                                borderRadius: BorderRadius.circular(10),
                                controller: waterBillCustomerController
                                    .waterUnitController,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            /* CustomWidgets.text("ค่ารักษามาตรวัดน้ำ : ",
                                fontSize: 8.sp),
                            SizedBox(
                              height: 0.5.h,
                            ),*/
                            // unitContainer(text: " 0.00"),
                            /* /// *************** meterMaintenanceFee texfeild ***************
                            SizedBox(
                              height: 5.h,
                              child: CustomTextFormField(
                                obscureText: false,
                                borderRadius: BorderRadius.circular(10),
                                controller: waterBillCustomerController
                                    .meterMaintenanceFeeController,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomWidgets.text("ส่วนลด :", fontSize: 8.sp),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            // unitContainer(text: " 0.00"),
                            /// *************** discount texfeild ***************
                            SizedBox(
                              height: 5.h,
                              child: CustomTextFormField(
                                obscureText: false,
                                borderRadius: BorderRadius.circular(10),
                                controller: waterBillCustomerController
                                    .discountController,
                                textAlign: TextAlign.center,
                              ),
                            ),*/
                            SizedBox(
                              height: 1.h,
                            ),

                            /// *************** VAT texfeild ***************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomWidgets.text("ภาษีมูลค่าเพิ่ม :",
                                    fontSize: 8.sp),
                                CustomWidgets.text(
                                  "7%",
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomWidgets.text("$waterMeterPicture : ",
                                fontSize: 8.sp),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),

                      /// *************** Meter Image**************
                      Center(
                        child: waterBillCustomerController
                                    .imagePath.isNotEmpty &&
                                imageUploadUrl != " "
                            ? Container(
                                height: 20.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.textGreyColor),
                                ),
                                child: Image.file(
                                  File(waterBillCustomerController
                                      .imagePath.value),
                                  fit: BoxFit.fill,
                                ))
                            // child: Image.network(imageUploadUrl,fit: BoxFit.fill,))
                            : Container(
                                height: 20.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.borderGreyColor,
                                        width: 0.6.w)),
                              ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      /// *************** Capture Image icon for  Image**************
                      GestureDetector(
                        onTap: () async {
                          await PermissionHandlerPermissionService
                                  .handleCameraPermission(context)
                              .then((bool cameraPermission) async {
                            if (cameraPermission == true) {
                              await openImagePicker(ImageSource.camera)
                                  .then((value) async {
                                if (value.path.isNotEmpty || value.path != "") {
                                  waterBillCustomerController.imageName.value =
                                      value.path.split("/").last;
                                  waterBillCustomerController.imagePath.value =
                                      value.path;
                                  // _upload(File(waterBillCustomerController
                                  //     .imagePath
                                  //     .toString()));
                                  DioAPIManager().multiPartRequest(
                                      file: File(waterBillCustomerController
                                          .imagePath
                                          .toString()));
                                }
                                print(
                                    "Image Name :::: ${waterBillCustomerController.imageName}");
                                print(
                                    "Image Path :::: ${waterBillCustomerController.imagePath}");
                              });
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              size: 18,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomWidgets.text("ถ่ายภาพ", fontSize: 8.sp),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      /// *************** Create Bill button **************
                      CustomButton(
                        onTap: () async {
                          if (waterBillCustomerController
                              .waterUnitController.text.isEmpty) {
                            errorSnackBar(
                                title: 'Water Unit',
                                message: 'Please Add Water Unit');
                          } else if (waterBillCustomerController
                              .imagePath.value.isEmpty) {
                            errorSnackBar(
                                title: 'Meter Photo',
                                message: 'Please Capture Meter Photo');
                          } else {
                            /* waterBillCustomerController.createWaterBill(
                              waterUserNumberID:
                              custDestails.userWaterID.toString(),
                              houseResidentID:
                              custDestails.houseResidentID.toString(),
                              branchID: customerBill.branchID.toString(),
                              houseID: custDestails.houseID.toString(),
                              WaterUnit: waterBillCustomerController.waterUnitController.text,
                              previousWaterUnit:
                              custDestails.previousMonthunit.toString(),
                              month: monthId,
                              year: year,
                              Discount: waterBillCustomerController.discountController.text,
                              MeterMaintenance:waterBillCustomerController.meterMaintenanceFeeController.text ,
                              CreateBy: LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID.toString(),
                              MeterPhoto: imageUploadUrl.toString(),
                            );*/
                            var data = await waterBillCustomerController
                                .createWaterBill(
                                    userNumberID:
                                        custDestails.userWaterNumber.toString(),
                                    houseID: custDestails.houseID.toString(),
                                    houseResidentID:
                                        custDestails.houseResidentID.toString(),
                                    userID: custDestails.userWaterID.toString(),
                                    branchID: customerBill.branchID.toString(),
                                    preWaterUnit: custDestails.previousMonthunit
                                        .toString(),
                                    waterUnit: waterBillCustomerController
                                        .waterUnitController.text,
                                    month: monthId,
                                    year: year,
                                    meterImage: imageUploadUrl.toString(),
                                    createBy: LoginSuccessModel.fromJson(
                                            GetStorage().read(userData))
                                        .list![0]
                                        .officerID
                                        .toString());

                            successSnackBar(
                                message: 'Bill Create Successfully.');
                            Future.delayed(
                              const Duration(seconds: 2),
                            ).then(
                              (value) async {
                                // Get.toNamed(Routes.PRINT_BILL_SCREEN);
                                waterBillCustomerController.clearData();
                                Get.offNamed(Routes.DASHBOARD_SCREEN);
                              },
                            );

                            Future.delayed(const Duration(seconds: 1), () {
                              showProgressIndicator();
                            });
                            Future.delayed(
                              const Duration(seconds: 2),
                            ).then(
                              (value) async {
                                var captureImage = ScreenshotWidget(context);
                                screenshotController
                                    .captureFromWidget(
                                        InheritedTheme.captureAll(
                                            context,
                                            Material(
                                              child: SizedBox(
                                                  height: 200.h,
                                                  child: captureImage),
                                            )),
                                        delay: const Duration(seconds: 1))
                                    .then((capturedImage) async {
                                  dismissProgressIndicator();
                                  await PermissionHandlerPermissionService
                                          .handlePhotosPermission(context)
                                      .then((bool photoPermission) async {
                                    if (photoPermission == true) {
                                      _saved(capturedImage);
                                    }
                                  }).then((value) {
                                    successSnackBar(
                                        message: 'Save Bill to Gallery');
                                  });
                                });
                              },
                            );
                          }
                          // Get.toNamed(Routes.SCREENSHOT_SCREEN);
                          // Get.toNamed(Routes.PRINT_BILL_SCREEN);

                          // await createBillApi();
                        },
                        width: double.infinity,
                        margin: const EdgeInsets.all(0),
                        color: AppColors.loginBtnColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.print,
                              color: AppColors.textWhiteColor,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomWidgets.text(
                              SaveAndPrintInvoices,
                              fontWeight: FontWeight.w600,
                              fontSize: 9.sp,
                              color: AppColors.textWhiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  )
                : Container();
          }),
        ),
      ),
    );
  }

  Container unitContainer({String? text}) {
    return Container(
      height: 5.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderGreyColor, width: 0.5.w)),
      child: CustomWidgets.text(text!,
          fontSize: 8.sp, fontWeight: FontWeight.w600),
    );
  }

  Future<File> openImagePicker(ImageSource sourceData) async {
    XFile? xFile = await ImagePicker().pickImage(
      source: sourceData,
    );
    return File(xFile!.path);
  }

  /// save image to Gallary
  _saved(image) async {
    final result = await ImageGallerySaver.saveImage(image);
    if (kDebugMode) {
      print(result);
    }
    if (kDebugMode) {
      print("File Saved to Gallery");
    }
  }

  Padding ScreenshotWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.3),
      // margin: EdgeInsets.only(bottom: 5),
      // height: 1000,
      child: Container(
        padding: EdgeInsets.all(6),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          // margin: EdgeInsets.only(bottom: 5),
          // height: 1000,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///   water bill
                Center(
                  child: CustomWidgets.text(
                    "ใบแจ้งหนี้ค่าน้ำประปา",
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                  ),
                ),

                /// (not a receipt)
                Center(
                  child: CustomWidgets.text(
                    '(ไม่ใช่ใบเสร็จรับเงิน)',
                    // fontWeight: FontWeight.w600,
                    fontSize: 7.sp,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                /// Bang Pahan Municipality
                Center(
                  child: CustomWidgets.text(
                    "เทศบาลตำบลบางปะหัน",
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                  ),
                ),

                ///90 Moo 6, Bang Pahan Subdistrict, Bang Pahan District
                /// Phra Nakhon Si Ayutthaya Province 13220
                /// Phone : 035-301-777
                Center(
                  child: CustomWidgets.text(
                    '90 หมู่ 6 ตำบลบางปะหัน อำเภอบางปะหัน \n '
                    'จังหวัดพระนครศรีอยุธายา 13220\nโทรศัพท์ : 035-301-777',
                    textAlign: TextAlign.center,
                    fontSize: 7.sp,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                /// invoice number   & water user number
                Container(
                  height: 25,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("เลขที่ใบแจ้งหนี้",
                              fontSize: 8.sp, fontWeight: FontWeight.w600)),
                      VerticalDivider(
                          width: 5, color: Colors.black, thickness: 1),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "เลขที่ผู้ใช้น้ำ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "256600001",
                            fontSize: 8.sp,
                          )),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "0001",
                            fontSize: 8.sp,
                          )),
                    ],
                  ),
                ),
                ///water bill date & due date
                Container(
                  height: 25,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("วันที่แจ้งค่าน้ำ",
                              fontSize: 8.sp, fontWeight: FontWeight.w600)),
                      VerticalDivider(
                          width: 5, color: Colors.black, thickness: 1),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "วันครบกำหนดชำระ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "10/01/2566",
                            fontSize: 8.sp,
                          )),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "24/01/2566",
                            fontSize: 8.sp,
                          )),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 2,
                // ),
                /// name
                Row(
                  children: [
                    CustomWidgets.text(
                      "ชื่อ   : ",
                      fontWeight: FontWeight.w700,
                      fontSize: 8.sp,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomWidgets.text(
                        "น.ส.ประหยัด รวยมาก",
                        fontSize: 8.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),

                /// address
                Row(
                  children: [
                    CustomWidgets.text(
                      "ที่อยู่ : ",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomWidgets.text(
                        "999 หมู่ 1 ตำบลบางปะหัน อำเภอบางปะหัน จังหวัดพระนครศรีอยุธยา 13220",
                        maxLine: 2,
                        fontSize: 8.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),

                ///water usage information, last time, this time
                Container(
                  height: 30,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("ข้อมูลการใช้น้ำ",
                              fontSize: 7.5.sp, fontWeight: FontWeight.w600)),
                      VerticalDivider(
                          width: 5, color: Colors.black, thickness: 1),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("ครั้งก่อน",
                              fontSize: 7.5.sp, fontWeight: FontWeight.w600)),
                      VerticalDivider(
                          width: 5, color: Colors.black, thickness: 1),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                            "ครั้งนี้",
                            fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          margin: EdgeInsets.only(left: 5),
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                              "วันเดือนปีที่อ่าน เลขในมาตรวัดน้ำ",
                              fontSize: 7.5.sp,
                              textAlign: TextAlign.center)),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("24/12/2565 1995",
                              fontSize: 7.5.sp, textAlign: TextAlign.center)),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 28,
                          alignment: Alignment.center,
                          child: CustomWidgets.text("24/01/2566 2010",
                              fontSize: 7.5.sp, textAlign: TextAlign.center)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                /// Total Box
                Container(
                  //height: 220,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1,
                      ),

                      ///  water bill,
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ค่าน้ำ",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "182.00",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),

                      ///  discount
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ส่วนลด",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              " 18.20",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),

                      ///   service fee
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ค่ารักษามาตรวัดน้ำ",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "30.00",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8, color: Colors.black, thickness: 1),

                      /// Total monthly water bill
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "รวมเงินค่าน้ำประปาประจำเดือน",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "193.80",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8, color: Colors.black, thickness: 1),

                      /// T0 months overdue
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ค้างชำระ",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "0.00",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8, color: Colors.black, thickness: 1),

                      /// TImprove the amount of water received in excess

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ค่าน้ำที่รับไว้เกิน",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "0.00",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),

                      /// VAT 7%
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "ภาษีมูลค่าเพิ่ม 7%",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "13.57",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),

                      ///
                      Divider(height: 8, color: Colors.black, thickness: 1),

                      /// Total

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.text(
                              "รวมทั้งสิ้น",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomWidgets.text(
                              "207.37",
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                ///*Please pay all water bills by the day ______________If overdue, you may be suspended from using water.
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CustomWidgets.text(
                      "*โปรดชำระเงินค่าน้ำทั้งหมดภายในวันที่_______________ถ้าเกินกำหนด ท่านอาจจะถูกระงับการใช้น้ำ",
                      fontSize: 8.sp,
                      textAlign: TextAlign.left),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 46,
                      height: 130,
                      alignment: Alignment.center,
                      // color: Colors.red,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Image.network(
                        "https://qr-official.line.me/gs/M_823fceyb_BW.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2 - 46,
                        height: 130,
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Image.network(
                          "https://qr-official.line.me/gs/M_823fceyb_BW.png",
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
                // SizedBox(height: 5),
                Container(
                  height: 40,
                  // color: Colors.red,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomWidgets.text(
                                "QR Code สำหรับชำระเงิน",
                                fontSize: 7.5.sp,
                              ),
                            ],
                          )),
                      Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 2 - 38,
                          alignment: Alignment.center,
                          child: CustomWidgets.text(
                              "เมื่อชำระเงินแล้วกรุณาแจ้งชำระเงินได้ที่ Line นี้",
                              fontSize: 7.5.sp,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// monthlyWaterSuplyfee set a static bcz can't find in api
