import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              "24 Monday",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Flexible(
                          child: ListTile(
                        title: Text("Event name"),
                        subtitle: Text("Event discription maybe..."),
                      )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
