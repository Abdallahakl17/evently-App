import 'package:enently/core/theme/app_color/app_colors_ligth.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              border: Border.all(color: LightAppColors.stroke, width: 1),
              color: LightAppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 24.w,
              color: LightAppColors.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
