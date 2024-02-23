import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/current_time_card.dart';
import 'package:new_prayer_app/widgets/events_card.dart';
import 'package:new_prayer_app/widgets/timings_card.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool topExpanded = false;
  PageController _pageController = PageController(viewportFraction: 0.8);

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
          AnimatedCrossFade(
            crossFadeState: topExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Durations.long2,
            secondChild: SizedBox(
              height: 80,
              width: double.infinity,
              child: const Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "24 - 1443",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700, height: 1),
                      ),
                      Text(
                        "Jumada al-akhira",
                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            firstChild: SizedBox(
              height: 80,
              child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  padEnds: false,
                  children: List.generate(
                    5,
                    (index) => Card(
                      elevation: 0,
                      margin: EdgeInsets.only(left: 10, right: (index == 4) ? 10 : 0),
                      color: Colors.white.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Dhuhr"),
                      ),
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
              child: Stack(
            children: [
              Positioned.fill(
                  child: Column(
                children: [Spacer(), Image.asset('assets/lunar/earth.png')],
              )),
              Positioned.fill(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          "assets/lunar/lunar_5.png",
                          height: 180,
                        )
                      ],
                    ),
                  )
                ],
              )),
              AnimatedPositioned(
                top: topExpanded ? screenSize.height / 2 : 0,
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
