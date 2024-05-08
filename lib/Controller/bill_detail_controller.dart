import 'package:get/get.dart';

import '../Api/api_manager.dart';
import '../Model/bill_pay_model.dart';
import '../Repository/bill_pay_repository.dart';
import '../Utils/constants.dart';

class BillDetailController extends GetxController {
  BillPayRepository billPayRepository = BillPayRepository(APIManager());

  cashBillPay({
    required String? houseResidentID,
    String? PaymentMethod,
    String? AmountPaid,
    String? UpdateBy,
  }) async {
    BillPayModel createBill = await billPayRepository.billPayApiCall({
      "HouseResidentID": houseResidentID,
      "PaymentMethod": PaymentMethod,
      "AmountPaid": AmountPaid,
      "UpdateBy": UpdateBy
    });
    if (createBill.status == 1) {
      successSnackBar(message: createBill.saveMessage);
    } else {
      errorSnackBar(message: createBill.saveMessage);
    }
  }
}
