import 'package:enently/core/model/category_model.dart';
import 'package:enently/features/widget/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBarItems extends StatelessWidget {
  CustomTabBarItems({
    super.key,
    required this.selectedIndex,
    required this.categories,
    required this.onCategoryItemClicked,
  });
  List<CategoryModel>? categories;
  final void Function(int, CategoryModel)? onCategoryItemClicked;
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: categories!.length,
      child: TabBar(
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 12),
        labelPadding: REdgeInsets.symmetric(horizontal: 4),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        onTap: (index) {
          onCategoryItemClicked?.call(index, categories![index]);
        },
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,

        tabs: categories!.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;

          return TabItem(
            category: category,
            selectedBgColor: colors.primary,
            selectedFgColor: colors.onPrimary,
            unSelectedBgColor: colors.surfaceContainer,
            unSelectedFgColor: colors.onSurface,
            isSelected: selectedIndex == index,
          );
        }).toList(),
      ),
    );
  }
}
