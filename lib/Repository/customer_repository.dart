import 'package:water_bill_app/Api/api_manager.dart';
import '../Api/dio_api_manager.dart';
import '../Model/bill_summary_model.dart';
import '../Model/customer_bill_list_model.dart';
import '../Model/customer_details_model.dart';
import '../Model/customer_list_model.dart';
import '../Model/payment_details_model.dart';
import '../Model/payment_summary_model.dart';



class CustomerRepository {
  final APIManager apiManager;
  final DioAPIManager dioAPIManager;

  CustomerRepository(this.apiManager,this.dioAPIManager);

/*  ///
  /// get customer list api call
  ///
  Future<CustomerListModel> customerListAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall(
      '${apiManager.baseUrl}/Services.asmx/CustomerList',params

    );
    var response = CustomerListModel.fromJson(jsonData);
    return response;
  }*/
  ///
  /// get customer detail api
  ///
  Future<CustomerListModel> customerListAPI({String? OfficerID,
    String? Month,String? Year}) async {
    var jsonData = await apiManager.getAPICall("${apiManager.baseUrl}Services.asmx/CustomerList?OfficerID=$OfficerID&Month=$Month&Year=$Year",isLoaderShow: true);
    var response = CustomerListModel.fromJson(jsonData);
    return response;
  }

  ///
  /// get customer Bill List api
  ///
    Future<CustomerBillListModel> customerBillListAPI(String? HouseResidentID) async {
      var jsonData = await apiManager.getAPICall(
        '${apiManager.baseUrl}/Services.asmx/CustomerBillList?HouseResidentID=$HouseResidentID',
      );
      var response = CustomerBillListModel.fromJson(jsonData);
      return response;
    }


  ///
  /// get customer detail api
  ///
  Future<CutomerDetiailsModel> customerDetailAPI({String? HouseResidentID,
    String? Month,String? year}) async {
    var jsonData = await apiManager.getAPICall("${apiManager.baseUrl}/Services.asmx/CustomerDetails?HouseResidentID=$HouseResidentID&Month=$Month&year=$year");
    var response = CutomerDetiailsModel.fromJson(jsonData);
    return response;
  }


  ///
  /// get  Bill Summary api
  ///
  Future<BillSummaryModel> billSummaryAPI(String? HouseResidentID) async {
    var jsonData = await apiManager.getAPICall(
      '${apiManager.baseUrl}/Services.asmx/BillSummary?HouseResidentID=$HouseResidentID',
    );
    var response = BillSummaryModel.fromJson(jsonData);
    return response;
  }

  ///
  /// get Payment Details api
  ///
  Future<PaymentDetailsModel> paymentDetailsAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall("${apiManager.baseUrl}/Services.asmx/PaymentDetails", params);
    var response = PaymentDetailsModel.fromJson(jsonData);
    return response;
  }

  ///
  /// get Payment Summary api
  ///
  Future<PaymentSummaryModel> paymentSummaryAPI(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall("${apiManager.baseUrl}/Services.asmx/PaymentSummary", params);
    var response = PaymentSummaryModel.fromJson(jsonData);
    return response;
  }

}
