import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/home/home_provider.dart';
import 'package:enently/core/theme/app_theme/app_ligth_theme.dart';
import 'package:enently/features/home/tabs/favorite_tab.dart';
import 'package:enently/features/home/tabs/home_tab.dart';
import 'package:enently/features/home/tabs/person_tab.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Widget> tabs = [HomeTab(), FavoriteTab(), PersonTab()];
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
     body: tabs[homeProvider.index],
      floatingActionButton: Container(
        width: 48.w,
        height: 48.h,

        decoration: BoxDecoration(
          color: lightColorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeProvider.index,
        onTap: homeProvider.changedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              homeProvider.index == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeProvider.index == 1 ? Icons.favorite : Icons.favorite_outline,
            ),
            label: appLocalizations.favourite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeProvider.index == 2 ? Icons.person : Icons.person_outline,
            ),
            label: appLocalizations.profile,
          ),
        ],
      ),
    );
  }
}
