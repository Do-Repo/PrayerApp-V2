import 'package:flutter/material.dart';

class CurrentTimeCard extends StatelessWidget {
  const CurrentTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(0.6),
      margin: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Afternoon",
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    Text("Still 3 hours left for Aasr to begin.")
                  ],
                )),
            Image.asset(
              "assets/images/dhuhr.png",
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
