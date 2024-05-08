import 'package:water_bill_app/Api/api_manager.dart';


import '../Model/month _year_list_model.dart';

class MonthYearRepository {
  final APIManager apiManager;

  MonthYearRepository(this.apiManager);



  ///
  /// get year list api call
  Future<MonthYearListModel> monthYearListAPI() async {
    var jsonData = await apiManager.getAPICall(
      '${apiManager.baseUrl}/Services.asmx/MonthYearList?',
    );

    var response = MonthYearListModel.fromJson(jsonData);
    return response;
  }

}