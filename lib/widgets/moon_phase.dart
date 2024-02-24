import 'package:flutter/material.dart';

class MoonPhase extends StatelessWidget {
  const MoonPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Flexible(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "24 - 1443",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700, height: 1),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Jumada al-akhira",
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ])),
              ),
              Image.asset(
                "assets/lunar/lunar_5.png",
                height: 180,
              )
            ],
          ),
        )
      ],
    );
  }
}
