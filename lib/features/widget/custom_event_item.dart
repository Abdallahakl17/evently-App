import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  EventItem({super.key, required this.markAsFavourite});
  bool markAsFavourite;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool favourite = widget.markAsFavourite;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final themeProvider = context.watch<ThemeProvider>();
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.outlineVariant, width: 1.w),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            themeProvider.isDark
                ? AppImagesDark.meeting
                : AppImagesLigth.meeting,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: REdgeInsets.all(8),

            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Text(
                'widget.event.dateTime!.getMonth',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          SizedBox(height: 97.h),
          Card(
            margin: REdgeInsets.all(8),
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'widget.event.title' ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      favourite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
