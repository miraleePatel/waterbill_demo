// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:water_bill_app/Screens/CreateAWaterBill/create_water_bill_screen.dart';
import 'package:water_bill_app/Screens/CreateAWaterBill/screenshot_screen.dart';
import 'package:water_bill_app/Screens/MainPage/carry_bill_details_screen.dart';
import 'package:water_bill_app/Screens/MainPage/overdue_bill_details_screen.dart';
import 'package:water_bill_app/Screens/MainPage/paid_bill_detail_screen.dart';
import 'package:water_bill_app/Screens/dashboard_screen.dart';
import 'package:water_bill_app/Screens/Authentication/login_screen.dart';
import '../Screens/CreateAWaterBill/see_customerbill_list_screen.dart';
import '../Screens/CreateAWaterBill/water_bill_customer_screen.dart';
import '../Screens/MainPage/main_screen.dart';
import '../Screens/StaffInformation/staff_information_screen.dart';
import '../Screens/splash_screen.dart';
import 'routes.dart';


class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;
  // static const INITIAL_ROUTE = Routes.LOGIN_SCREEN ;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: () => const LoginScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.DASHBOARD_SCREEN,
        page: () => DashboardScreen(),
        maintainState: true,
    ),
    GetPage(
        name: Routes.MAIN_SCREEN,
        page: () => const MainScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.WATER_BILL_CUSTOMER_SCREEN,
        page: () =>  WaterBillCustomerScreen(),
        maintainState: true,
    ),
    GetPage(
        name: Routes.CREATE_WATER_BILL_SCREEN,
        page: () =>  CreateWaterBillScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.SEE_CUSTOMERBILL_LIST_SCREEN,
        page: () =>  SeeCustomerBillListScreen(),
        maintainState: true,
       // binding: HomeBinding()
    ),
    GetPage(
        name: Routes.STAFFINFORMATION_SCREEN,
        page: () => const StaffInformationScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.OVERDUE_BILL_DETAILS_SCREEN,
        page: () =>  OverdueBillDetailsScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.PAID_BILL_DETAILS_SCREEN,
        page: () =>  PaidBillDetailScreen(),
        maintainState: true
    ),
     GetPage(
        name: Routes.CARRY_BILL_DETAILS_SCREEN,
        page: () => CarryBillDetailsScreen(),
        maintainState: true
    ),
  GetPage(
        name: Routes.SCREENSHOT_SCREEN,
        page: () => ScreenShotScreen(),
        maintainState: true
    ),

  ];
}


/*class AppRouter {
  static generateRoute(BuildContext context) {
    return {
      Routes.SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
      Routes.LOGIN_SCREEN: (BuildContext context) => const LoginScreen(),
      Routes.DASHBOARD_SCREEN: (BuildContext context) => const DashboardScreen(),
      Routes.MAIN_SCREEN: (BuildContext context) => const MainScreen(),
      Routes.WATER_BILL_CUSTOMER_SCREEN: (BuildContext context) => const WaterBillCustomerScreen(),
      Routes.CREATE_WATER_BILL_SCREEN: (BuildContext context) => const CreateWaterBillScreen(),
      Routes.SEE_CUSTOMERBILL_LIST_SCREEN: (BuildContext context) => const SeeCustomerBillListScreen(),
      Routes.STAFFINFORMATION_SCREEN: (BuildContext context) => const StaffInformationScreen(),
      Routes.OVERDUE_BILL_DETAILS_SCREEN: (BuildContext context) => const OverdueBillDetailsScreen(),
      Routes.PAID_BILL_DETAILS_SCREEN: (BuildContext context) => const PaidBillDetailScreen(),

    };
  }
}*/

/*
class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;
  // static const INITIAL_ROUTE = Routes.LOGIN_SCREEN ;

  static final routes = [
    GetPage(
        name: Routes.SPLASH_SCREEN,
        page: () => const SplashScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: () => const LoginScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.DASHBOARD_SCREEN,
        page: () => DashboardScreen(),
        maintainState: true,

        children: []
    ),
    GetPage(
        name: Routes.MAIN_SCREEN,
        page: () => const MainScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.WATER_BILL_CUSTOMER_SCREEN,
        page: () =>  WaterBillCustomerScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.CREATE_WATER_BILL_SCREEN,
        page: () =>  CreateWaterBillScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.SEE_CUSTOMERBILL_LIST_SCREEN,
        page: () =>  SeeCustomerBillListScreen(),
        maintainState: true,
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.STAFFINFORMATION_SCREEN,
        page: () => const StaffInformationScreen(),
        maintainState: true
    ),
    GetPage(
        name: Routes.OVERDUE_BILL_DETAILS_SCREEN,
        page: () =>  OverdueBillDetailsScreen(),
        maintainState: true
    ), GetPage(
        name: Routes.PAID_BILL_DETAILS_SCREEN,
        page: () =>  PaidBillDetailScreen(),
        maintainState: true
    ),

  ];
}*/
