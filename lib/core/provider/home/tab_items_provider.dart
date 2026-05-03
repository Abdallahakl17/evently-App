import 'package:enently/core/model/category_model.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/shared.dart';

class TabItemsProvider extends ChangeNotifier {
  int selectedIndex = 0;

  List<EventModel> events = [];
  bool isLoading = false;

  List<CategoryModel> categories = [];

  void initCategories(BuildContext context) {
    categories = CategoryModel.getCategoriesWithAll(context);
  }

  Future<void> changeIndex(int index, BuildContext context) async {
    selectedIndex = index;
    notifyListeners();

    await loadEvents(context);
  }

  CategoryModel get selectedCategory => categories[selectedIndex];

  Future<void> loadEvents(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final category = selectedCategory;

      events = await StoreService.getEventFromFireStore(
        context,
        category.id == '0' ? null : category,
      );
      print("CATEGORY: ${selectedCategory.id}");
      print("EVENTS: ${events.length}");
    } catch (e) {
      debugPrint("Error loading events: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
