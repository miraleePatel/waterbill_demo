import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'Routes/app_pages.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        // final isValidHost = ["192.168.1.67"].contains(host); // <-- allow only hosts in array
        return true;
      });
  }
}
var sdkInt;
Future<void> main() async {
  /// binds the framework to the Flutter engine.
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    sdkInt = androidInfo.version.sdkInt;
  }
  /// GetStorage Initialization
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Water Bill',
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL_ROUTE,
          // home: GetStorage().read(userData) == null ?  LoginScreen() :  DashboardScreen()
        );
      },
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return GetMaterialApp(
//             title: 'Water Bill',
//             debugShowCheckedModeBanner: false,
//             builder: EasyLoading.init(),
//             getPages: AppPages.routes,
//             initialRoute: AppPages.INITIAL_ROUTE,
//             // home: GetStorage().read(userData) == null ? const LoginScreen() : const DashboardScreen()
//             // FirstFragment(),
//             );
//       },
//     );
//   }
// }
