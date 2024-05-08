import 'package:water_bill_app/Api/api_manager.dart';
import '../Model/dashboard_count_model.dart';
import '../Model/dashboard_model.dart';
import '../Model/db_paymentwise_custlist_model.dart';
import '../Model/payment_status_model.dart';



class DashboardRepository {
  final APIManager apiManager;

  DashboardRepository(this.apiManager);


  ///
  ///  DashBoard api
  ///
  Future<DashboardModel> dashboardAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall("${apiManager.baseUrl}Services.asmx/Dashboard", params);
    var response = DashboardModel.fromJson(jsonData);
    return response;
  }

  ///
  ///  Dashboardcount  api
  ///
  Future<DashboardcountModel> dashboardCountAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall("${apiManager.baseUrl}/Services.asmx/Dashboardcount", params);
    var response = DashboardcountModel.fromJson(jsonData);
    return response;
  }

  ///
  ///  Paymentstatus  api
  ///
  Future<PaymentstatusModel> paymentStatusAPI() async {
    var jsonData = await apiManager.getAPICall(
      '${apiManager.baseUrl}/Services.asmx/Paymentstatus?',
    );
    var response = PaymentstatusModel.fromJson(jsonData);
    return response;
  }


  ///
  ///  DBPaymentWiseCustList  api
  ///
  Future<DBPaymentWiseCustListModel> dbPaymentWiseCustListAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall("${apiManager.baseUrl}/Services.asmx/DBPaymentwiseCustlist", params);
    var response = DBPaymentWiseCustListModel.fromJson(jsonData);
    return response;
  }

}
