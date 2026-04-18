import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/assets/routes_const.dart';
import 'package:enently/features/home/custom_arroe_back_button.dart';
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
        leading: CustomArrowBack(),

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
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.confirmresetpassword);
              },
              child: Text(appLocalizations.reset_password),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

