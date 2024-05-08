import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_color.dart';

class CustomDropDownButton extends StatefulWidget {
  String? value;
  List<DropdownMenuItem<String>>? items;
  Function(String?)? onChanged;
  CustomDropDownButton({Key? key, this.value, this.items, this.onChanged}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  // String dropdownValue = "ประปาประจำเดือน มกราคม 2566";
  // String allBiilDropdownValue = 'ชำระแล้ว'; ////paid

  @override
  void initState() {
    // TODO: implement initState
    // print("Item :::: ${widget.items!.length}");
    // print("value :::: ${widget.value}");
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.textGreyColor,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          alignment: Alignment.center,
          // hint: Text(
          //   'Select Item',
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: Theme.of(context).hintColor,
          //   ),
          // ),
          icon: Container(
            height: 5.5.h,
            width: 5.h,
            decoration: const BoxDecoration(
              color: AppColors.bottomIndiColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(9),
                bottomRight: Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.textWhiteColor,
            ),
          ),
          items: widget.items,
          value: widget.value,
          onChanged: widget.onChanged,
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
        ),
      ),
    );
  }
}
