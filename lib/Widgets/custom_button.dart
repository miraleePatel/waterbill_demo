import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  double? height;
  double? width;
  Widget? child;
  Color? color;
  EdgeInsetsGeometry? margin;
  CustomButton({Key? key, this.onTap, this.height, this.width, this.child, this.color, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height ?? 5.5.h,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          margin: margin ?? const EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child),
    );
  }
}
