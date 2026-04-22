import 'package:enently/core/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  TabItem({
    super.key,
    required this.category,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.isSelected,
  });

  CategoryModel category;
  Color selectedBgColor;
  Color selectedFgColor;
  Color unSelectedBgColor;
  Color unSelectedFgColor;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? selectedBgColor : unSelectedBgColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.outlineVariant, width: 1.w),
      ),

      child: Center(
        child: Row(
          children: [
            Icon(
              category.icon,
              color: isSelected ? colors.onPrimary : colors.primary,
            ),
            SizedBox(width: 8.w),
            Text(
              category.name,
              style: textTheme.bodyLarge?.copyWith(
                color: isSelected ? colors.onPrimary : colors.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
