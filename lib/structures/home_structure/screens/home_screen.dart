// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/current_prayer_carousel.dart';
import 'package:new_prayer_app/widgets/current_time_card.dart';
import 'package:new_prayer_app/widgets/events_card.dart';
import 'package:new_prayer_app/widgets/moon_phase.dart';
import 'package:new_prayer_app/widgets/timings_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool topExpanded = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Durations.long2,
      decoration: BoxDecoration(
        color: (topExpanded) ? Colors.black : Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).padding.top,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  topExpanded = !topExpanded;
                });
              },
              child: const CurrentTimeCard()),
          const SizedBox(height: 10),
          CurrentPrayer(),
          const SizedBox(height: 10),
          Flexible(
              child: Stack(
            children: [
              Positioned.fill(
                  child: Column(
                children: [const Spacer(), Image.asset('assets/lunar/earth.png')],
              )),
              Positioned.fill(child: MoonPhase()),
              AnimatedPositioned(
                top: topExpanded ? screenSize.height / 1.5 : 0,
                bottom: 0,
                left: 0,
                right: 0,
                duration: Durations.long3,
                curve: Curves.easeInOut,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Column(
                    children: [
                      Divider(height: 1),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [TimingsCard(), EventsCard()],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
