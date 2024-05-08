import 'package:get/get.dart';
import 'package:water_bill_app/Api/api_manager.dart';

import '../Model/create_bill_model.dart';
import 'package:http/http.dart' as http;

import '../Routes/routes.dart';
import '../Utils/constants.dart';
class CreateBillRepository {

  final APIManager apiManager;

  CreateBillRepository(this.apiManager);

/*  Future<CreateBillModel> createBillApiCall(Map<String, dynamic> params) async {
    var jsonData = await apiManager.postAPICall(
      '${apiManager.baseUrl}Services.asmx/CreateBill',
      params,
    );

    var response = CreateBillModel.fromJson(jsonData);
    return response;
  }*/

  Future<void> createBillApiCall({
    required String userNumberID,
    required String houseID,
    required String houseResidentID,
    required String userID,
    required String branchID,
    required String preWaterUnit,
    required String waterUnit,
    required String month,
    required String year,
    required String meterImage,
    required String createBy
  }) async {
    var request = await apiManager.postbillAPICall(
        'http://api.smartservicethailand.com/municipality-water/create-water-bill',
        { "userNumberID": userNumberID,
          "houseID": houseID,
          "houseResidentID": houseResidentID,
          "userID": userID,
          "branchID": branchID,
          "preWaterUnit": preWaterUnit,
          "waterUnit": waterUnit,
          "month": month,
          "year": year,
          "meterImage": meterImage,
          "createBy": createBy}
    );
  }


}
