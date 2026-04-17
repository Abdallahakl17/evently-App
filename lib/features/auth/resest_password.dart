import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/theme/app_color/app_color_dark.dart';
import 'package:enently/core/theme/app_color/app_colors_ligth.dart';
import 'package:enently/core/theme/app_theme/app_ligth_theme.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResestPassword extends StatelessWidget {
  const ResestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Align(
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
        ),

        title: Text(appLocalizations!.forget_passwor_reset),
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                AppImagesLigth.restpassword,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(appLocalizations.reset_password),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
