// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:water_bill_app/Screens/Create%20a%20water%20bill/create_water_bill_screen.dart';
// import 'package:water_bill_app/Screens/Main%20Page/main_screen.dart';
// import 'package:water_bill_app/Screens/Staff%20Information/staffInformation_screen.dart';
// import 'package:water_bill_app/Utils/app_color.dart';
// import 'package:water_bill_app/Widgets/custom_widget.dart';
//
// import '../generated/assets.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen>
//     with TickerProviderStateMixin {
//   TabController? tabController;
//   @override
//   void initState() {
//     tabController = TabController(vsync: this, length: 3);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//             border: Border(top: BorderSide(color: AppColors.textGreyColor))),
//         child: TabBar(
//           controller: tabController,
//           indicator: TopIndicator(),
//           overlayColor: MaterialStateProperty.all(
//             AppColors.bottomIndiColor,
//           ),
//           labelColor: AppColors.bottomIndiColor,
//           unselectedLabelStyle:  TextStyle(
//             fontSize: 13,
//           ),
//           unselectedLabelColor: AppColors.textGreyColor,
//           automaticIndicatorColorAdjustment: true,
//           labelPadding: EdgeInsets.only(right: 10,bottom: 5),
//           tabs:  [
//             Tab(
//               icon: Icon(
//                 Icons.home,size:25.sp,
//               ),
//               text: 'Main Page',
//               iconMargin: EdgeInsets.only(bottom: 3),
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.event_note_rounded,size:25.sp,
//               ),
//               iconMargin: EdgeInsets.only(bottom: 3),
//               text: 'Create a water bill',
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.person,size:25.sp,
//               ),
//               iconMargin: EdgeInsets.only(bottom: 3),
//               text: 'Staff Information',
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//          MainScreen(),
//           CreateWaterBillScreen(),
//           StaffInformationScreen()
//         ],
//       ),
//     );
//   }
// }
//
// class TopIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _TopIndicatorBox();
//   }
// }
//
// class _TopIndicatorBox extends BoxPainter {
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
//     Paint _paint = Paint()
//       ..color = AppColors.bottomIndiColor
//       ..strokeWidth = 5
//       ..isAntiAlias = true;
//     canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Controller/dashboard_controller.dart';
import '../Utils/app_color.dart';
import '../Utils/string_constant.dart';
import 'CreateAWaterBill/water_bill_customer_screen.dart';
import 'MainPage/main_screen.dart';
import 'StaffInformation/staff_information_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PersistentTabController? controller;
  DashboardController dashboardController = Get.put(DashboardController());


  @override
  void initState() {
    controller = PersistentTabController(initialIndex: 1);
    // dashboardController.getMonthList();
    // dashboardController.getYearList();

    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      MainScreen(),
      WaterBillCustomerScreen(),
      StaffInformationScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: (mainScreen),
        activeColorPrimary: AppColors.bottomIndiColor,
        inactiveColorPrimary: AppColors.textGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.event_note_rounded),
        title: (createAWaterBill),
        activeColorPrimary: AppColors.bottomIndiColor,
        inactiveColorPrimary: AppColors.textGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
        ),
        title: (staffInformation),
        activeColorPrimary: AppColors.bottomIndiColor,
        inactiveColorPrimary: AppColors.textGreyColor,

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}




/*
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin{
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
   tabController = TabController(length: 3, vsync: this);
  }

  bool selcte = false;
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        // color: CustomColor.bgBottem,
        child: TabBar(
            indicator: TopIndicator(),
            indicatorPadding: EdgeInsets.only(left: 8.5.w, right: 8.5.w),
            controller: tabController,
            onTap: (value) {
              selectIndex = value;
              setState(() {});
            },
            unselectedLabelStyle: TextStyle(color: AppColors.textGreyColor),
            tabs: [
           Tab(
             icon:Icon(Icons.home) ,
             text:(mainScreen) ,
           ) ,     Tab(
             icon:Icon(Icons.event_note_rounded) ,
             text:(createAWaterBill),
           )  ,    Tab(
             icon:Icon(
          Icons.person,
        ),
             text:(staffInformation) ,
           )

            ]),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MainScreen(),
      WaterBillCustomerScreen(),
      StaffInformationScreen(),
        ],
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color =AppColors.bottomIndiColor
      ..strokeWidth = 2
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}*/
