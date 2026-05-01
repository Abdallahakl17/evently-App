import 'package:enently/core/model/event_model.dart';
import 'package:enently/features/widget/custom_event_item.dart';
import 'package:enently/features/widget/custom_tab_bar_items.dart';
import 'package:enently/shared.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});
  EventModel? event;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      final provider = context.read<TabItemsProvider>();

      provider.initCategories(context);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        provider.loadEvents(context);
      });

      _initialized = true;
    }
  }

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
            builder: (context, provider, _) {
              return SizedBox(
                height: 50.h,
                child: CustomTabBarItems(
                  categories: provider.categories,
                  selectedIndex: provider.selectedIndex,
                  onCategoryItemClicked: (index, category) {
                    provider.changeIndex(index, context);
                  },
                ),
              );
            },
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Consumer<TabItemsProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.events.isEmpty) {
                  return const Center(child: Text("No events found"));
                }

                return ListView.builder(
                  itemCount: provider.events.length,
                  itemBuilder: (context, index) {
                    final event = provider.events[index];

                    return Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.deatailsScreen,  arguments: event,

                          );
                        },

                        child: EventItem(markAsFavourite: true, event: event),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
