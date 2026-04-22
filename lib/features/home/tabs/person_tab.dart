import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/config/provider_lang.dart';
import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
import 'package:enently/features/widget/custom_container_tab.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonTab extends StatelessWidget {
  PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final themeProvider = context.watch<ThemeProvider>();
    final lagProvider = context.watch<LangProvider>();
    AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 52.r,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AppImagesLigth.restpassword),
            ),
            SizedBox(height: 20.h),
            Text('name', style: textTheme.titleLarge),
            Text('email', style: textTheme.bodyMedium),
            SizedBox(height: 32.h),
            CustomContainerTab(
              text: appLocalizations!.dark_mode,
              trailing: Switch(
                value: themeProvider.isDark,
                onChanged: (toggle) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            SizedBox(height: 16.h),

            CustomContainerTab(
              text: appLocalizations.language,
              trailing: DropdownButton<String>(
                value: lagProvider.currentLang,
                underline: const SizedBox(),
                style: textTheme.titleLarge,

                items: const [
                  DropdownMenuItem(value: "en", child: Text("English")),
                  DropdownMenuItem(value: "ar", child: Text("Arabic")),
                  DropdownMenuItem(value: "es", child: Text("Español")),
                ],

                onChanged: (value) {
                  if (value != null) {
                    lagProvider.changeLang(value);
                  }
                },
              ),
            ),
            SizedBox(height: 16.h),

            CustomContainerTab(
              text: appLocalizations.logout,
              trailing: IconButton(
                onPressed: () {
                  DialogUtils.showLogoutDialog(context);
                },
                icon: Icon(Icons.logout, color: colors.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
