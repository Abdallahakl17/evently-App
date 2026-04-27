import 'package:enently/core/model/category_model.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/provider/auth/user_provider.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/home/home_provider.dart';
import 'package:enently/core/provider/home/tab_items_provider.dart';
import 'package:enently/features/widget/custom_event_item.dart';
import 'package:enently/features/widget/custom_tab_bar_items.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final userProvider = context.watch<UserProvider>();

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${appLocalizations.welcome_back} ✨",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      userProvider.currentUser?.name ?? 'Loading...',
                      style: textTheme.titleLarge,
                    ),
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
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(child: Text('En', style: textTheme.labelLarge)),
                ),
              ],
            ),
          ),

          Consumer<TabItemsProvider>(
            builder:
                (
                  BuildContext context,
                  TabItemsProvider provider,
                  Widget? child,
                ) {
                  return SizedBox(
                    height: 50.h,
                    child: CustomTabBarItems(
                      categories: CategoryModel.getCategoriesWithAll(context),

                      selectedIndex: provider.selectedIndex,
                      onCategoryItemClicked: (index, catogry) {
                        provider.changeIndex(index);
                      },
                    ),
                  );
                },
          ),
          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: EventItem(markAsFavourite: true),
          ),
        ],
      ),
    );
  }
}
