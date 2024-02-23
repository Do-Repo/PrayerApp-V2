import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/home_structure/screens/hijri_calendar_screen.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class TimingsCard extends StatefulWidget {
  const TimingsCard({super.key});

  @override
  State<TimingsCard> createState() => _TimingsCardState();
}

class _TimingsCardState extends State<TimingsCard> with SingleTickerProviderStateMixin {
  TextStyle timingsStyle = const TextStyle(fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dateSection(),
            const SizedBox(height: 15),
            prayerTimeSection(),
            prayerTimeSection(),
            prayerTimeSection(),
            prayerTimeSection(),
            prayerTimeSection(),
            prayerTimeSection(),
          ],
        ),
      ),
    );
  }

  Widget prayerTimeSection() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text("Imsak", style: timingsStyle), const Spacer(), Text("05:43", style: timingsStyle)],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Card(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.notifications_outlined),
            ),
          )
        ],
      ),
    );
  }

  Widget dateSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "24 Monday, January 2022",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, height: 0),
              ),
              Text(
                "20 Jumada al-akhirah 1443",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
      ],
    );
  }
}
