import 'package:get_storage/get_storage.dart';
import 'package:water_bill_app/Api/api_manager.dart';
import 'package:water_bill_app/Model/login_success_model.dart';
import 'package:water_bill_app/Model/staff_detail_model.dart';
import 'package:water_bill_app/Utils/string_constant.dart';

class StaffDetailRepository {
  final APIManager apiManager;

  StaffDetailRepository(this.apiManager);

  ///
  /// Post staff information api call
  Future<StaffDetailModel> staffDetailAPI() async {
    var jsonData = await apiManager.postAPICall('${apiManager.baseUrl}Services.asmx/StaffDetails',
        {"OfficerID": LoginSuccessModel.fromJson(GetStorage().read(userData)).list![0].officerID!.toString()});
    var response = StaffDetailModel.fromJson(jsonData);
    return response;
  }
}
