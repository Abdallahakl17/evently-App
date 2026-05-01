import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/ex/date_ex.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/features/widget/custom_arroe_back_button.dart';
import 'package:enently/shared.dart';

class DeatailsScreen extends StatelessWidget {
  DeatailsScreen({super.key, required this.eventModel});
  EventModel? eventModel;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowBack(),
        title: Text(appLocalizations.event_details),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: colors.primary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: colors.error),
          ),
        ],
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: Image.asset(AppImagesLigth.bookClub, fit: BoxFit.contain),
            ),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 16),
              child: Text(eventModel!.title ?? "", style: textTheme.titleLarge),
            ),
            Container(
              width: double.infinity,
              height: 76.h,
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: colors.surfaceContainer,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: colors.outlineVariant),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 16.w,
                children: [
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: ShapeDecoration(
                      color: colors.surface,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: colors.outlineVariant,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Center(child: Icon(Icons.date_range_sharp)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        eventModel!.dateTime!.getMonth,
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        eventModel!.dateTime!.getFormattedTime,
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(appLocalizations.description, style: textTheme.titleLarge),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              height: 76.h,
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: colors.surfaceContainer,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: colors.outlineVariant),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "${eventModel!.description}",
                style: textTheme.bodyMedium!.copyWith(color: colors.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
