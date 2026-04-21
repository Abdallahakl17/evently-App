import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w),

        child: GestureDetector(
          onTap: () => Navigator.pop(context),

          child: Container(
            padding: EdgeInsets.all(4.w),

            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.secondary),
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(8.r),
            ),

            child: Icon(
              Icons.arrow_back_ios_new,
              size: 24.w,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
