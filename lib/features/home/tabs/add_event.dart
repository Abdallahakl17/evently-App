import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/model/category_model.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/utils/utils_ui/buttons.dart';
import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:enently/core/validators/validator.dart';
import 'package:enently/features/widget/custom_arroe_back_button.dart';
import 'package:enently/features/widget/custom_tab_bar_items.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared.dart';

class AddEvent extends HookWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final categories = CategoryModel.getCategories(context);

    final selectedCategory = useState<CategoryModel>(categories[0]);
    final selectedIndex = useState(0);
    final selectedDateTime = useState<DateTime?>(null);
    final selectedTime = useState<TimeOfDay?>(null);
    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final colors = Theme.of(context).colorScheme;

    //For the date only

    Future<void> selectDate() async {
      final date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
      );
      if (date != null) {
        selectedDateTime.value = DateTime(
          date.year,
          date.month,
          date.day,

          //there we selectedtime from time day ? for time should be same in both time and date
          selectedTime.value?.hour ?? 0,
          selectedTime.value?.minute ?? 0,
        );
      }
    }

    Future<void> addEvent() async {
      EventModel event = EventModel(
        ownerId: UserModel.currentUser!.id,
        id: "",
        category: selectedCategory.value,
        title: titleController.text,
        description: descController.text,
        dateTime: selectedDateTime.value,
      );
      DialogUtils.showLoading(context);

      await StoreService.addEventToFireStore(event, context);

      DialogUtils.showSnackBar(
        context,
        backgroundColor: colors.primary,
        appLocalizations.event_added_successfully,
      );

      Navigator.pop(context);
    }

    // for the Time only
    Future<void> selectTime() async {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        selectedTime.value = time;

        final baseDate = selectedDateTime.value ?? DateTime.now();

        selectedDateTime.value = DateTime(
          baseDate.year,
          baseDate.month,
          baseDate.day,
          time.hour,
          time.minute,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowBack(key: key),
        title: Text(appLocalizations.add_event),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(AppImagesLigth.meeting),
              ),

              SizedBox(height: 16.h),

              CustomTabBarItems(
                selectedIndex: selectedIndex.value,
                categories: categories,
                onCategoryItemClicked: (index, category) {
                  selectedIndex.value = index;
                  selectedCategory.value = category;
                },
              ),

              SizedBox(height: 16.h),

              Text(appLocalizations.title, style: textTheme.titleLarge),
              SizedBox(height: 8.h),
              CustomTextField(
                validator: (value) => Validators.validateTitle(context, value),
                controller: titleController,

                hintText: appLocalizations.event_title,
              ),

              SizedBox(height: 16.h),

              Text(appLocalizations.description, style: textTheme.titleLarge),
              SizedBox(height: 8.h),
              CustomTextField(
                validator: (value) =>
                    Validators.validateDescription(context, value),
                controller: descController,
                hintText: appLocalizations.event_description,
                maxLines: 8,
              ),

              SizedBox(height: 16.h),

              // DATE
              Row(
                children: [
                  const Icon(Icons.date_range_outlined),
                  SizedBox(width: 8.w),

                  Text(
                    selectedDateTime.value == null
                        ? appLocalizations.event_date
                        : "${selectedDateTime.value!.day}/${selectedDateTime.value!.month}/${selectedDateTime.value!.year}",
                    style: textTheme.titleLarge,
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: selectDate,
                    child: Text(
                      appLocalizations.choose_date,
                      style: textTheme.labelSmall,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // TIME
              Row(
                children: [
                  const Icon(Icons.access_time),
                  SizedBox(width: 8.w),

                  Text(
                    selectedTime.value == null
                        ? appLocalizations.event_time
                        : selectedTime.value!.format(context),
                    style: textTheme.titleLarge,
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: selectTime,
                    child: Text(
                      appLocalizations.choose_time,
                      style: textTheme.labelSmall,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              AppCustomButton(
                text: appLocalizations.add_event,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (selectedDateTime.value == null) {
                      DialogUtils.showSnackBar(
                        context,
                        appLocalizations.please_choose_date,
                        backgroundColor: colors.error,
                      );
                      return;
                    }

                    if (selectedTime.value == null) {
                      DialogUtils.showSnackBar(
                        context,
                        appLocalizations.please_choose_time,
                        backgroundColor: colors.error,
                      );

                      return;
                    }

                    await addEvent();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
