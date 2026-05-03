import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/ex/date_ex.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/shared.dart';
 

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event, required bool markAsFavourite});

  final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  Future<void> _toggleFavourite() async {
    final user = UserModel.currentUser!;
    final isFav = user.favouriteEventsIds.contains(widget.event.id);

    if (isFav) {
      await StoreService.removeEventFromFavourite(widget.event.id!);
      user.favouriteEventsIds.remove(widget.event.id);
    } else {
      await StoreService.addEventToFavourite(widget.event.id!);
      user.favouriteEventsIds.add(widget.event.id!);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final themeProvider = context.watch<ThemeProvider>();

    final user = UserModel.currentUser!;
    final isFav = user.favouriteEventsIds.contains(widget.event.id);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.outlineVariant),
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
              padding: REdgeInsets.all(8),
              child: Text("${widget.event.dateTime?.getMonth}"),
            ),
          ),

          const SizedBox(height: 97),

          Card(
            margin: REdgeInsets.all(8),
            child: Padding(
              padding: REdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: Text(widget.event.title ?? "")),

                  IconButton(
                    onPressed: _toggleFavourite,
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : null,
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
