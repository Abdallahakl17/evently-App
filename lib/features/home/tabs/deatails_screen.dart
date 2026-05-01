import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/ex/date_ex.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/core/services/firebase_sevices/auth_service.dart';
import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
import 'package:enently/features/widget/custom_arroe_back_button.dart';
import 'package:enently/shared.dart';

class DeatailsScreen extends StatelessWidget {
  DeatailsScreen({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    Future<void> delete() async {
      final confirm = await DialogUtils.showLogoutDialog(
        context,
        tittle: appLocalizations.delete_event,
        desc: appLocalizations.delete_event_message,
      );

      if (confirm == true) {
        DialogUtils.showLoading(context);

        await StoreService.deletEvent(context, eventModel);

        if (context.mounted) {
          Navigator.pop(context);

          Navigator.pop(context);
        }

        DialogUtils.showToastMessage(
          message: appLocalizations.event_deleted_successfully,
          bgColor: Colors.green,
        );
      }
    }

    final isOwner = AuthService.auth.currentUser!.uid == eventModel.ownerId;

    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: Text(appLocalizations.event_details),
        actions: isOwner
            ? [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: colors.primary),
                ),
                IconButton(
                  onPressed: () async {
                    await delete();
                  },
                  icon: Icon(Icons.delete, color: colors.error),
                ),
              ]
            : [],
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(AppImagesLigth.bookClub, fit: BoxFit.contain),
            ),

            Padding(
              padding: REdgeInsets.symmetric(vertical: 16),
              child: Text(eventModel.title ?? "", style: textTheme.titleLarge),
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
                    child: const Center(child: Icon(Icons.date_range_sharp)),
                  ),

                  SizedBox(width: 16.w),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventModel.dateTime!.getMonth,
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        eventModel.dateTime!.getFormattedTime,
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
                eventModel.description ?? "",
                style: textTheme.bodyMedium?.copyWith(color: colors.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
