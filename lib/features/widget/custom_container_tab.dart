import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerTab extends StatelessWidget {
   CustomContainerTab({super.key,
    required this.text,
    required this .trailing
    });
  final   String text;
   final  Widget trailing;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 48.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outlineVariant),
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text, style: textTheme.titleLarge),trailing],
      ),
    );
  }
}
