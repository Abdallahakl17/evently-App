import 'package:enently/core/assets/app_images.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginSection extends StatelessWidget {
  final VoidCallback onGoogleTap;
bool isLoiginScreen=true;
    SocialLoginSection({super.key, required this.onGoogleTap,
  required this.isLoiginScreen
  
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(appLocalizations.or, style: text.titleSmall),
            ),
            const Expanded(child: Divider()),
          ],
        ),

        SizedBox(height: 24.h),

        /// Google Button
        Material(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: onGoogleTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: colors.outlineVariant),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.googleIamge, height: 24.h, width: 24.w),
                  SizedBox(width: 12.w),
                  Text(
                  isLoiginScreen?  appLocalizations.login_with_google:appLocalizations.signup_with_google,
                    style: text.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
