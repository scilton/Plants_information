import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double? height;
  final Color? backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final double radius;
  final VoidCallback function;
  final String text;

  const CustomButton(
      {super.key,
      this.height,
      this.width = double.infinity,
      this.backgroundColor,
      this.textColor = AppColors.buttonTextColor,
      this.textSize = 14,
      this.textWeight = FontWeight.w400,
      this.radius = 10,
      required this.function,
      required this.text,
      this.borderColor = AppColors.defaultColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: borderColor),
      ),
      child: InkWell(
        onTap: function,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius,
            ),
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
          child: Text(
             text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize.sp,
              fontWeight: textWeight,
            ),
          ),
        ),
      ),
    );
  }
}
