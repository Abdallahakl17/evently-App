import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:enently/features/widget/custom_event_item.dart';
import 'package:enently/shared.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: appLocalizations.search_for_event,
              suffixIcon: const Icon(Icons.search),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: FutureBuilder(
                future: StoreService.getFavouriteEvents(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  final favouriteEvents = snapshot.data ?? [];

                  if (favouriteEvents.isEmpty) {
                    return const Center(child: Text("No favourites yet"));
                  }

                  return ListView.separated(
                    itemCount: favouriteEvents.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      return EventItem(
                        event: favouriteEvents[index],
                        markAsFavourite: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
