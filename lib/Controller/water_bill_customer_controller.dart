import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:water_bill_app/Api/api_manager.dart';
import 'package:water_bill_app/Api/dio_api_manager.dart';
import 'package:water_bill_app/Model/customer_list_model.dart';
import 'package:water_bill_app/Repository/create_bill_repository.dart';
import '../Model/bill_summary_model.dart';
import '../Model/create_bill_model.dart';
import '../Model/customer_bill_list_model.dart';
import '../Model/customer_details_model.dart';
import '../Model/payment_details_model.dart';
import '../Model/payment_summary_model.dart';
import '../Repository/customer_repository.dart';
import '../Routes/routes.dart';
import '../Utils/constants.dart';
import 'dashboard_controller.dart';
import 'package:http/http.dart' as http;
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WaterBillCustomerController());
  }
}

class WaterBillCustomerController extends GetxController {
  DashboardController dashboardController = Get.put(DashboardController());
  TextEditingController waterUnitController = TextEditingController();
  TextEditingController previousMonthUnitController = TextEditingController();
  TextEditingController cashPayController = TextEditingController();
  TextEditingController meterMaintenanceFeeController =
      TextEditingController(text: "0.00");
  TextEditingController discountController =
      TextEditingController(text: "0.00");
  CustomerRepository customerRepository =
      CustomerRepository(APIManager(), DioAPIManager());
  CreateBillRepository createBillRepository =
      CreateBillRepository(APIManager());
  // RxString custDropValue = "เมษายน 2566".obs;
  RxString custDropValue = "เมษายน 2566".obs;
  String? monthId = "4";
  String? year = "2023";
  TextEditingController serchController = TextEditingController();
  RxList<Customer> customerList = <Customer>[].obs;
  RxList<Customer> searchCustomerList = <Customer>[].obs;
  var houseSearchString = ''.obs;
  RxBool isShow = false.obs;
  RxList<CustomerBill> customerBillList = <CustomerBill>[].obs;
  Rx<CutomerDetiailsModel> cutomerDetiailsModel = CutomerDetiailsModel().obs;
  Rx<CutomerDetiail> cutomerDetiail = CutomerDetiail().obs;
  RxList<CutomerDetiail> cutomerDetiailList = <CutomerDetiail>[].obs;
  Rx<BillSummaryModel> billSummaryModel = BillSummaryModel().obs;
  Rx<BillSummary> billSummary = BillSummary().obs;
  RxList<BillSummary> billSummaryList = <BillSummary>[].obs;
  Rx<PaymentDetailsModel> paymentDetailsModel = PaymentDetailsModel().obs;
  Rx<PaymentDetails> paymentDetails = PaymentDetails().obs;
  RxList<PaymentSummary> paymentSummaryList = <PaymentSummary>[].obs;
  double? overDueTotal;
  double? paidTotal;
  var imageName = ''.obs;
  var imagePath = ''.obs;
  APIManager? apiManager;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getMonthList();
    // getMonthYear();
    findMonth();
    print("call controller");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    waterUnitController.clear();
    // meterMaintenanceFeeController.clear();
    // discountController.clear();
  }

  clearData() {
    imagePath.value = "";
    imageName.value = "";
    waterUnitController.clear();
    meterMaintenanceFeeController.clear();
    discountController.clear();

  }

  // ///
  // /// get monthYearList api
  // ///
  // getMonthYear() async {
  //   monthYearList.clear();
  //   MonthYearListModel res =
  //   await monthYearRepository.monthYearListAPI();
  //   monthYearList.addAll(res.list!);
  // }

  findMonth() {
    for (var element in dashboardController.monthYearList) {
      if (element.cYear == custDropValue.value) {
        monthId = element.cMonth.toString();
        year = element.name!.split(" ").last.toString();
      }
    }
    log("::::::::: Month id :::::::: $monthId");
    log("::::::::: year :::::::: $year");
  }

  var listStatus = " ".obs;

  ///
  /// get customer list
  getCustomerList({String? OfficerID, String? Month, String? Year}) async {
    customerList.clear();
    CustomerListModel res = await customerRepository.customerListAPI(
        OfficerID: OfficerID, Month: Month, Year: Year);
    customerList.addAll(res.list!);
    if (res.status == 0) {
      listStatus.value = "ไม่มีข้อมูล ";
    }
    // customerListModel.value = await customerRepository.customerListAPI(
    //     LoginSuccessModel.fromJson(GetStorage().read(userData))
    //         .list![0]
    //         .officerID!
    //         .toString());
    // CustomerInfo.value = CustomerListModel.fromJson(customerListModel);
  }

  filterCustomerList() {
    searchCustomerList.clear();
    searchCustomerList.value = customerList
        .where((element) =>
            (element.houseNo!.toLowerCase().contains(houseSearchString)))
        .toList();
  }

  ///
  /// get customer Bill List api
  ///
  getCustomerBillList(String? HouseResidentID) async {
    customerBillList.clear();
    CustomerBillListModel res =
        await customerRepository.customerBillListAPI(HouseResidentID);
    customerBillList.addAll(res.list!.reversed);
  }

  ///
  /// get cutomer Detiails
  ///
  getCustomerDetails(
      {String? HouseResidentID, String? Month, String? year}) async {
    cutomerDetiailsModel.value = await customerRepository.customerDetailAPI(
        HouseResidentID: HouseResidentID, Month: Month, year: year);
    cutomerDetiail.value = cutomerDetiailsModel.value.list![0];
  }

  /*///
  /// get cutomer Detiails
  ///
  getCustomerDetailsList({String? HouseResidentID,
    String? Month,String? year}) async {
    cutomerDetiailList.clear();
    CutomerDetiailsModel res =
        await customerRepository.customerDetailAPI(HouseResidentID:HouseResidentID ,Month:Month ,year: year);
    cutomerDetiailList.addAll(res.list!);
  }
*/
  ///
  /// get cutomer Detiails
  ///
  getBillSummary(String? HouseResidentID) async {
    billSummaryList.clear();
    BillSummaryModel res =
        await customerRepository.billSummaryAPI(HouseResidentID);
    billSummaryList.addAll(res.list!);
    if (billSummaryList.length != 1) {
      overDueTotal = billSummaryList.last.carryOver! +
          billSummaryList.last.paymentAmount!.toDouble();
    } else {
      overDueTotal = billSummaryList.last.paymentAmount!.toDouble();
    }

    print("overDueTotal ::::::::: $overDueTotal");
  }


  createWaterBill(
      {
        required String userNumberID,
        required String houseID,
        required String houseResidentID,
        required String userID,
        required String branchID,
        required String preWaterUnit,
        required String waterUnit,
        required String month,
        required String year,
        required String meterImage,
        required String createBy
      }) async {
   await createBillRepository.createBillApiCall(
        userNumberID : userNumberID,
      houseID:houseID ,
      houseResidentID:houseResidentID ,
      userID: userID,
      branchID: branchID,
      preWaterUnit: preWaterUnit,
      waterUnit:waterUnit ,
      month: month,
      year:year ,
      meterImage: meterImage,
      createBy: createBy
    );
  }
  /*createWaterBill(
      {required String? waterUserNumberID,
      required String? houseResidentID,
      String? branchID,
      String? houseID,
      String? previousWaterUnit,
      String? WaterUnit,
      String? month,
      String? year,
      String? MeterMaintenance,
      String? Discount,
      String? CreateBy,
      String? MeterPhoto}) async {
    CreateBillModel createBill = await createBillRepository.createBillApiCall({
      "WaterUserNumberID": waterUserNumberID,
      "HouseResidentID": houseResidentID,
      "BranchID": branchID,
      "HouseID": houseID,
      "PreviousWaterUnit": previousWaterUnit,
      "WaterUnit": WaterUnit,
      "Month": month,
      "Year": year,
      "MeterMaintenance": MeterMaintenance,
      "Discount": Discount,
      "CreateBy": CreateBy,
      "MeterPhoto": MeterPhoto
    });

    if (createBill.status == 1) {
      // successSnackBar(message:createBill.message);
      successSnackBar(message: 'Bill Create Successfully.');
      Future.delayed(
        const Duration(seconds: 2),
      ).then(
        (value) async {
          // Get.toNamed(Routes.PRINT_BILL_SCREEN);
          // Get.offNamed(Routes.PRINT_BILL_SCREEN);
          Get.offNamed(Routes.DASHBOARD_SCREEN);
          clearData();
        },
      );
    } else {
      errorSnackBar(message: createBill.message);
    }
  }
*/
/*/// save image to Gallary
  _saved(image) async {
    final result = await ImageGallerySaver.saveImage(image);
    if (kDebugMode) {
      print(result);
    }
    if (kDebugMode) {
      print("File Saved to Gallery");
    }}*/

  /// get cutomer Detiails
  ///
  getPaymentDetails(Map<String, dynamic> params) async {
    // paymentDetailsList.clear();
    paymentDetailsModel.value =
        await customerRepository.paymentDetailsAPI(params);
    paymentDetails.value = paymentDetailsModel.value.list![0];
    // paymentDetailsList.addAll(res.list!);
    findPaidDate();
    // changeTimeFromate();
  }

  /// get PaymentS ummary
  ///
  getPaymentSummary(Map<String, dynamic> params) async {
    paymentSummaryList.clear();
    PaymentSummaryModel res =
        await customerRepository.paymentSummaryAPI(params);
    paymentSummaryList.addAll(res.list!);

    if (paymentSummaryList.length != 1) {
      paidTotal = paymentSummaryList.last.carryOver! +
          paymentSummaryList.last.paymentAmount!.toDouble();
    } else {
      paidTotal = paymentSummaryList.last.paymentAmount!.toDouble();
      // print("overDueTotal else ::::::::: ${paymentSummaryList.last.paymentAmount}");
    }
    print("overDueTotal ::::::::: $paidTotal");
  }

  var dueDateFormate;
  findPaidDate({String? dueDate}) {
    var date = paymentDetails.value.duedate!.split(" ").first.toString();
    DateTime parseDate = new DateFormat("MM/dd/yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    final formatter = DateFormat('dd MMMM yyyy', 'th');
    dueDateFormate = formatter.format(inputDate);
  }
/*  var paymentDate;
  var paymentTime;

  changeTimeFromate(){
    if(paymentDetails.value.paymentDate != null && paymentDetails.value.paymentDate != ""){

    var date = paymentDetails.value.paymentDate!.split(" ").first.toString();
    DateTime parseDate = new DateFormat("MM/dd/yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    final formatter = DateFormat('dd MMMM yyyy', 'th');
    paymentDate = formatter.format(inputDate);

      String text = "4/4/2023 7:27:25 PM";
       var time;
       var time1;
      List<String> words = text.split(" ");

      for (int i = 0; i < words.length; i++) {
        print("$i: ${words[i]}");
        if(i == 1){
          time = words[i];
        }
        if(i == 2){
          time1 = words[i];
        }
      }
    paymentTime = "${time}  ${time1}";
      print("time: ${time + time1}");

    }else{
      paymentDate = " - ";
    }
    }*/


}
