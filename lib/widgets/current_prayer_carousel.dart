import 'package:flutter/material.dart';

class CurrentPrayer extends StatelessWidget {
  const CurrentPrayer({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(viewportFraction: 0.8);

    return SizedBox(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dhuhr",
                          style: TextStyle(fontSize: 23),
                        ),
                        Spacer(),
                        Image.asset("assets/images/sunset.png", height: 25),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: const [
                          Text(
                            "12:20",
                            style: TextStyle(fontSize: 10),
                          ),
                          Spacer(),
                          Text(
                            "15:20",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.white.withOpacity(0.2),
                        child: Row(
                          children: [
                            Flexible(
                                child: Container(
                              color: Colors.white,
                            )),
                            Flexible(child: Container())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
