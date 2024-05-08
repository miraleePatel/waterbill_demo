import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_widget.dart';

class CustomBillScreenshotWidget extends StatefulWidget {
  const CustomBillScreenshotWidget({Key? key}) : super(key: key);

  @override
  State<CustomBillScreenshotWidget> createState() => _CustomBillScreenshotWidgetState();
}

class _CustomBillScreenshotWidgetState extends State<CustomBillScreenshotWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.3),
      // margin: EdgeInsets.only(bottom: 5),
      // height: 1000,
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 1,top: 2),
        // margin: EdgeInsets.only(bottom: 5),
        // height: 1000,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///   water bill
              Center(
                child: CustomWidgets.text(
                  "ใบแจ้งหนี้ค่าน้ำประปา",
                  fontWeight: FontWeight.w600,
                  fontSize: 8.sp,
                ),
              ),
              /// (not a receipt)
              Center(
                child: CustomWidgets.text(
                  '(ไม่ใช่ใบเสร็จรับเงิน)',
                  // fontWeight: FontWeight.w600,
                  fontSize: 7.sp,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              /// Bang Pahan Municipality
              Center(
                child: CustomWidgets.text(
                  "เทศบาลตำบลบางปะหัน",
                  fontWeight: FontWeight.w600,
                  fontSize: 8.sp,
                ),
              ),
              ///90 Moo 6, Bang Pahan Subdistrict, Bang Pahan District
              /// Phra Nakhon Si Ayutthaya Province 13220
              /// Phone : 035-301-777
              Center(
                child: CustomWidgets.text(
                  '90 หมู่ 6 ตำบลบางปะหัน อำเภอบางปะหัน \n '
                      'จังหวัดพระนครศรีอยุธายา 13220\nโทรศัพท์ : 035-301-777',textAlign: TextAlign.center, fontSize: 7.sp,
                  // fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              /// invoice number   & water user number
              Container(
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("เลขที่ใบแจ้งหนี้",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600)),
                    VerticalDivider(
                        width: 5,
                        color: Colors.black,
                        thickness: 1
                    ),
                    Container(
                        height:20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                          "เลขที่ผู้ใช้น้ำ",  fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Container(
                height: 25,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("256600001",  fontSize: 8.sp,
                        )),

                    Container(
                        height:20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                          "0001",  fontSize: 8.sp,
                        )),
                  ],
                ),
              ),

              ///water bill date & due date
              Container(
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("วันที่แจ้งค่าน้ำ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600)),
                    VerticalDivider(
                        width: 5,
                        color: Colors.black,
                        thickness: 1
                    ),
                    Container(
                        height:20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                          "วันครบกำหนดชำระ",  fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Container(
                height: 25,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("10/01/2566",  fontSize: 8.sp,
                        )),

                    Container(
                        height:20,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                          "24/01/2566",  fontSize: 8.sp,
                        )),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 2,
              // ),

              /// name
              Row(
                children: [
                  CustomWidgets.text(
                    "ชื่อ   : ",
                    fontWeight: FontWeight.w700,  fontSize: 8.sp,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: CustomWidgets.text(
                      "น.ส.ประหยัด รวยมาก",  fontSize: 8.sp,
                    ),
                  )
                ],
              ),
              SizedBox(height: 3,),

              /// address
              Row(
                children: [
                  CustomWidgets.text(
                    "ที่อยู่ : ",  fontSize: 8.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: CustomWidgets.text(
                      "999 หมู่ 1 ตำบลบางปะหัน อำเภอบางปะหัน จังหวัดพระนครศรีอยุธยา 13220",maxLine: 2 , fontSize: 8.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              ///water usage information, last time, this time
              Container(
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("ข้อมูลการใช้น้ำ",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600)),
                    VerticalDivider(
                        width: 5,
                        color: Colors.black,
                        thickness: 1
                    ),
                    Container(
                        height: 20,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("ครั้งก่อน",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600)),
                    VerticalDivider(
                        width: 5,
                        color: Colors.black,
                        thickness: 1
                    ),
                    Container(
                        height:20,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                          "ครั้งนี้",  fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 35,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.center,
                        child: CustomWidgets.text("วันเดือนปีที่อ่าน เลขในมาตรวัดน้ำ",  fontSize: 8.sp,textAlign: TextAlign.center
                        )),
                    Container(
                        height: 40,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        alignment: Alignment.center,
                        child: CustomWidgets.text("24/12/2565 1995", fontSize: 8.sp,textAlign: TextAlign.center
                        )),
                    Container(
                        height:40,
                        width:
                        MediaQuery.of(context).size.width /
                            3 -
                            28,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                            "24/01/2566 2010",  fontSize: 8.sp,textAlign: TextAlign.center
                        )),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              /// Total Box
              Container(
                //height: 220,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    ///  water bill,
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2,top: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ค่าน้ำ", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "182.00", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                    ///  discount
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ส่วนลด", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            " 18.20", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                    ///   service fee
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ค่ารักษามาตรวัดน้ำ", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "30.00", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),

                        ],
                      ),
                    ),
                    Divider(height: 8,color: Colors.black,thickness: 1),


                    /// Total monthly water bill
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "รวมเงินค่าน้ำประปาประจำเดือน", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "193.80", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),

                        ],
                      ),
                    ), Divider(height: 8,color: Colors.black,thickness: 1),


                    /// T0 months overdue
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ค้างชำระ", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "0.00", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 8,color: Colors.black,thickness: 1),
                    /// TImprove the amount of water received in excess

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ค่าน้ำที่รับไว้เกิน",fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "0.00",fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    /// VAT 7%
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "ภาษีมูลค่าเพิ่ม 7%", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "13.57",fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),

                    ///
                    Divider(height: 8,color: Colors.black,thickness: 1),
                    /// Total

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidgets.text(
                            "รวมทั้งสิ้น", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomWidgets.text(
                            "207.37", fontSize: 7.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              ///*Please pay all water bills by the day ______________If overdue, you may be suspended from using water.
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: CustomWidgets.text(
                    "*โปรดชำระเงินค่าน้ำทั้งหมดภายในวันที่_______________ถ้าเกินกำหนด ท่านอาจจะถูกระงับการใช้น้ำ",  fontSize: 8.sp,
                    textAlign: TextAlign.left
                ),
              ),
              // SizedBox(height: 5),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:
                    MediaQuery.of(context).size.width /
                        2 -
                        46,
                    height: 130,
                    alignment: Alignment.center,
                    // color: Colors.red,
                    margin: EdgeInsets.only(bottom: 10),
                    child:Image.network("https://qr-official.line.me/gs/M_823fceyb_BW.png",fit: BoxFit.fill,),
                  ),
                  Container(
                      width:
                      MediaQuery.of(context).size.width /
                          2 -
                          46,
                      height: 130,
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child:  Image.network("https://qr-official.line.me/gs/M_823fceyb_BW.png",fit: BoxFit.fill,)),
                ],
              ),
              // SizedBox(height: 5),
              Container(
                height: 39,
                // color: Colors.red,
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 35,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        // color: Colors.yellow,

                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomWidgets.text("QR Code สำหรับชำระเงิน",  fontSize: 8.sp,
                            ),
                          ],
                        )),
                    Container(
                        height:35,
                        width:
                        MediaQuery.of(context).size.width /
                            2 -
                            38,
                        alignment: Alignment.center,
                        child: CustomWidgets.text(
                            "เมื่อชำระเงินแล้วกรุณาแจ้งชำระเงินได้ที่ Line นี้",  fontSize: 8.sp, textAlign: TextAlign.center
                        )),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
