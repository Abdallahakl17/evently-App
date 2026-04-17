import 'package:enently/core/assets/app_images.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResestPassword extends StatelessWidget {
  const ResestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations!.forget_password)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(AppImagesLigth.restpassword, fit: BoxFit.cover),
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () {},
            child: Text(appLocalizations.forget_password),
          ),
        ],
      ),
    );
  }
}

 