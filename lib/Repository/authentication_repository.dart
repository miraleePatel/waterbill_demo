import 'package:water_bill_app/Api/api_manager.dart';
import 'package:water_bill_app/Model/login_success_model.dart';

class AuthenticationRepository {
  final APIManager apiManager;

  AuthenticationRepository(this.apiManager);

  /// Post login api call
  ///
  Future<LoginSuccessModel> loginApiCall(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall(
      '${apiManager.baseUrl}Services.asmx/Login',
      params,
    );

    var response = LoginSuccessModel.fromJson(jsonData);
    return response;
  }
}
