import 'dart:developer';
import 'package:get/get.dart';
import '../Api/api_manager.dart';
import '../Model/dashboard_count_model.dart';
import '../Model/dashboard_model.dart';
import '../Model/db_paymentwise_custlist_model.dart';
import '../Model/payment_status_model.dart';
import '../Repository/dashboard_repository.dart';
import 'dashboard_controller.dart';


class MainScreenController extends GetxController {
  DashboardController dashboardController = Get.put(DashboardController());
  // RxString mainDropValue = "มกราคม 2022".obs;
  RxString mainDropValue = "เมษายน 2566".obs;
  RxString billDropValue = "1".obs; ////paid
  List<String> concateMainList = <String>[].obs;
  DashboardRepository dashboardRepository = DashboardRepository(APIManager());
  Rx<DashboardModel> dashboardModel = DashboardModel().obs;
  Rx<Dashboard> dashboard = Dashboard().obs;
  Rx<DashboardcountModel> dashboardcountModel = DashboardcountModel().obs;
  Rx<Dashboardcount> dashboardcount = Dashboardcount().obs;
  RxList<Paymentstatus> paymentStatusList = <Paymentstatus>[].obs;
  RxList<DBPaymentwiseCustlist> dbPaymentWiseCustList = <DBPaymentwiseCustlist>[].obs;
  String? monthId = "4";
  String? year = "2023";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("call controller");
  }

  // ///
  // /// get month list
  // ///
  // getMonthList() async {
  //   MonthListModel res = await monthYearRepository.monthListAPI();
  //   monthList.addAll(res.list!);
  //   getYearList();
  // }
  //
  // ///
  // /// get year list
  // ///
  // getYearList() async {
  //   YearListModel res = await monthYearRepository.yearListAPI();
  //   yearList.addAll(res.list!);
  //   concateYearMonth();
  // }

  // ///Concate year nd month list for dropdown button
  // ///
  // concateYearMonth() {
  //   for (var element1 in yearList) {
  //     for (var monthEle in monthList) {
  //       concateMainList.add(
  //           "${monthEle.monthName!} ${element1.year!}");
  //     } // break;
  //   }
  //   // yearList.clear();
  //   // monthList.clear();
  // }


  ///
  /// Dashboard
  ///
  getDashboard(Map<String, dynamic> params) async {
    dashboardModel.value =
    await dashboardRepository.dashboardAPI(params);
    dashboard.value = dashboardModel.value.list![0];
  }

  ///
  /// Dashboard
  ///
  getDashboardcount(Map<String, dynamic> params) async {
    dashboardcountModel.value =
    await dashboardRepository.dashboardCountAPI(params);
    dashboardcount.value = dashboardcountModel.value.list![0];
  }

  ///
  ///getPaymentStatus api
  ///
  getPaymentStatus() async {
    paymentStatusList.clear();
    PaymentstatusModel res =
    await dashboardRepository.paymentStatusAPI();
    paymentStatusList.addAll(res.list!);
  }


  ///
  /// dbPaymentWiseCustList
  ///
  getDBPaymentWiseCustList(Map<String, dynamic> params) async {
    dbPaymentWiseCustList.clear();
    DBPaymentWiseCustListModel res = await dashboardRepository.dbPaymentWiseCustListAPI(params);
    dbPaymentWiseCustList.addAll(res.list!);
  }

  findMonth(){
    for (var element in dashboardController.monthYearList) {
      if (element.cYear == mainDropValue.value) {
        monthId = element.cMonth.toString();
        year = element.name!.split(" ").last;
        // log(" Month id :::::::: $monthId");
      }
    }
    log(" Month id :::::::: $monthId");
    log(" year :::::::: $year");
  }



}
