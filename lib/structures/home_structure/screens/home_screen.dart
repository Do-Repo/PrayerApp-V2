import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:new_prayer_app/widgets/current_time_card.dart';
import 'package:new_prayer_app/widgets/events_card.dart';
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
    // return Column(
    //   children: [
    //     AnimatedContainer(
    //       duration: Durations.long4,
    //       decoration: BoxDecoration(color: (topExpanded) ? Colors.black : Theme.of(context).primaryColor),
    //       child: AnimatedSize(
    //         duration: Durations.long1,
    //         child: SizedBox(
    //           height: topExpanded ? (screenSize.height - kBottomNavigationBarHeight - 26) : null,
    //           child: Column(
    //             children: [

    //               if (topExpanded) Spacer(),
    //               InkWell(
    //                   onTap: () {
    //                     setState(() {
    //                       topExpanded = !topExpanded;
    //                     });
    //                   },
    //                   child: Text(
    //                     "oi oi",
    //                     style: TextStyle(color: Colors.white),
    //                   )),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),

    //     )
    //   ],
    // );

    return AnimatedContainer(
      duration: Durations.short4,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).padding.top,
          ),
          const CurrentTimeCard(),
          SizedBox(height: 10),
          Flexible(
              child: Stack(
            children: [
              AnimatedPositioned(
                duration: Durations.short4,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Expanded(
                    child: Column(
                      children: [
                        const Divider(height: 1),
                        Flexible(
                          child: const SingleChildScrollView(
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
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
