import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart' as d;
import 'package:water_bill_app/Model/error_model.dart';
import 'package:water_bill_app/Utils/constants.dart';
import 'api_exception.dart';

var imageUploadUrl;
class DioAPIManager {
  Future<dynamic> multiPartRequest({
    required File file,
  }) async {
    print("File: ${file.path}");
    var responseJson;
    String filename = file.path.split('/').last;
    print("filename: ${file.path.split('/').last}");
    try {
      /// Show progress loader
      showProgressIndicator();

      var headers = {
        "Content-Type": "multipart/form-data",
        'Authorization':
        "Bearer 71|bGLlezsUcIAlEBvaZJaxvxfjP5JDtVlJfIu7G6vi6ad7bb27",
      };

      d.Dio dio = d.Dio();
      var formData = d.FormData.fromMap({
        'file': await d.MultipartFile.fromFile(
          file.path,
          filename: filename,
        ),
      });
      print("url :::::: ${formData.files.first}");
      d.Response response = await dio.post(
        "https://api.taobao2you.com/api/General/upload-file-with-type?UploadType=10",
        data: formData,
        options: d.Options(headers: headers),
      );

      print(response.data);
      print(
          "imageUploadUrl :::::::  ${response.toString().replaceAll('[', '').replaceAll(']', '')}");
      imageUploadUrl =
          response.toString().replaceAll('[', '').replaceAll(']', '');
      responseJson = _response(response);

      /// Check api response and handle exception
    } on SocketException {
      errorSnackBar(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// dismiss progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  /// Check response status and handle exception
  static _response(d.Response response) {
    // print(response.data);
    switch (response.statusCode) {
      /// Successfully get api response
      case 200:
        if (response.data['status'] == 0) {
          throw BadRequestException(ErrorModel.fromJson(response.data).message);
        } else {
          var responseJson = response.data;
          return responseJson;
        }

      /// Successfully get api response
      case 201:
        if (response.data['status'] == 0) {
          throw BadRequestException(ErrorModel.fromJson(response.data).message);
        } else {
          var responseJson = response.data;
          return responseJson;
        }

      /// Bad request need to check url
      case 400:
        throw BadRequestException(ErrorModel.fromJson(json.decode(response.data.toString())).message);

      /// Bad request need to check url
      case 401:
        throw BadRequestException(ErrorModel.fromJson(json.decode(response.data.toString())).message);

      /// Authorisation token invalid
      case 403:
        throw UnauthorisedException(ErrorModel.fromJson(json.decode(response.data.toString())).message);

      /// Authorisation token invalid
      case 417:
        throw UnauthorisedException(ErrorModel.fromJson(json.decode(response.data.toString())).message);

      /// Error occured while Communication with Server
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

// /// Check response status and handle exception
// static _response(d.Response response) {
//   print("${response.statusCode}");
//   print(response.data);
//   switch (response.statusCode) {
//
//     /// Successfully get api response
//     case 200:
//       if (ErrorModel.fromJson(json.decode(response.data)).message != 'OK') {
//         errorSnackBar(
//           message: ErrorModel.fromJson(json.decode(response.data)).message,
//         );
//         throw BadRequestException(ErrorModel.fromJson(
//           json.decode(
//             response.data.toString(),
//           ),
//         ).message);
//       } else {
//         var responseJson = json.decode(
//           response.data.toString(),
//         );
//         return responseJson;
//       }
//
//     /// Bad request need to check url
//     case 400:
//       throw BadRequestException(ErrorModel.fromJson(
//         json.decode(
//           response.data.toString(),
//         ),
//       ).message);
//
//     /// Authorisation token invalid
//     case 403:
//       throw UnauthorisedException(ErrorModel.fromJson(
//         json.decode(
//           response.data.toString(),
//         ),
//       ).message);
//
//     /// Error occured while Communication with Server
//     case 500:
//       throw UnauthorisedException(ErrorModel.fromJson(
//         json.decode(
//           response.data.toString(),
//         ),
//       ).message);
//
//     default:
//       throw FetchDataException(
//           'An error occurred occured while Communication with Server with StatusCode: ${response.statusCode}');
//   }
// }
}
