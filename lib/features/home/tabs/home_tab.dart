import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/home/home_provider.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${appLocalizations.welcome_back} ✨",
                      style: textTheme.bodyMedium,
                    ),
                    Text('UserModel.', style: textTheme.titleLarge),
                  ],
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: Icon(
                    themeProvider.isDark
                        ? Icons.nightlight_outlined
                        : Icons.wb_sunny_outlined,
                    color: colors.primary,
                    size: 24.w,
                  ),
                ),
                Container(
                  width: 32.w,
                  height: 32.h,
                  child: Center(child: Text('En', style: textTheme.labelLarge)),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
