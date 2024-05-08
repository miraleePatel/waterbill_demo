import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final TextAlign? textAlign;

   CustomTextFormField(
      {Key? key,
      this.controller,
      this.hintText,
      this.maxLines,
      this.validator,
      this.onChanged,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText,this.borderRadius,this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      obscureText: obscureText,

      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textBlackColor,
      ),
      onChanged: onChanged,
      onTap: onTap,
      textAlign: textAlign ?? TextAlign.start,
      cursorColor: AppColors.textBlackColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: SizerUtil.deviceType == DeviceType.mobile ? EdgeInsets.all(1.7.h) : EdgeInsets.all(1.2.h),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.5.sp : 8.5.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textGreyColor,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: AppColors.textWhiteColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGreyColor, width: 0.5.w),
            borderRadius:borderRadius ?? BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGreyColor, width: 0.5.w),
            borderRadius:borderRadius?? BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGreyColor, width: 0.5.w),
            borderRadius:borderRadius ?? BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGreyColor, width: 0.5.w),
            borderRadius:borderRadius ?? BorderRadius.circular(8),
          )),
    );
  }
}
