import 'package:get/state_manager.dart';
import 'package:water_bill_app/Api/api_manager.dart';
import 'package:water_bill_app/Model/staff_detail_model.dart';
import 'package:water_bill_app/Repository/staff_detail_repository.dart';

class StaffInformationController extends GetxController {
  StaffDetailRepository staffDetailRepository = StaffDetailRepository(APIManager());

  StaffDetailModel staffDetailModel = StaffDetailModel();
  Rx<Staff> staffInfo = Staff().obs;

  getStaffInformation() async {
    staffDetailModel = await staffDetailRepository.staffDetailAPI();
    staffInfo.value = staffDetailModel.list![0];
  }
}
