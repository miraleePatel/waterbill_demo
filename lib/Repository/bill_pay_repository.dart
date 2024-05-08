import 'package:water_bill_app/Api/api_manager.dart';
import '../Model/bill_pay_model.dart';


class BillPayRepository {

  final APIManager apiManager;

  BillPayRepository(this.apiManager);
  ///
  /// BillPayModel api
  ///
  Future<BillPayModel> billPayApiCall(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall(
      '${apiManager.baseUrl}/Services.asmx/BillPay',
      params,
    );

    var response = BillPayModel.fromJson(jsonData);
    return response;
  }


}