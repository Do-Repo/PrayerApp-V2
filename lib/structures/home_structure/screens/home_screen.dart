import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/current_time_card.dart';
import 'package:new_prayer_app/widgets/timings_card.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          CurrentTimeCard(),
          TimingsCard(),
          WidgetAnimator(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.event_outlined,
                          size: 35,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Upcoming events",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, height: 0),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
