
import 'package:get/get.dart';
import '../Api/api_manager.dart';
import '../Model/month _year_list_model.dart';
import '../Repository/month_year_list_repository.dart';


class DashboardController extends GetxController{

  MonthYearRepository monthYearRepository = MonthYearRepository(APIManager());
  RxList<MonthYearList> monthYearList = <MonthYearList>[].obs;
  String? defaultMonthId;
  String? defaultYear;
  String? defaultMonthYear;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMonthYear();
    print("call controller");
  }

  ///
  /// get monthYearList api
  ///
  getMonthYear() async {
    monthYearList.clear();
    MonthYearListModel res =
    await monthYearRepository.monthYearListAPI();
    monthYearList.addAll(res.list!);
  }


}