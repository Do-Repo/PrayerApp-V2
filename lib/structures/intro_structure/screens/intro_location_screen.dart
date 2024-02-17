import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/continue_button.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class IntroLocation extends StatelessWidget {
  const IntroLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text("Location required"),
          titleSpacing: 0,
          leading: const Icon(Icons.location_on_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              WidgetAnimator(
                child: Text(
                  "Your location is required for accurate prayer times. Please allow the app to use the GPS, or set your location manually.",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Spacer(),
              ContinueButton(
                  text: "Scan location", leading: const Icon(Icons.location_searching_outlined), onTap: () {}),
              SizedBox(height: 20),
              WidgetAnimator(
                child: Text(
                  "Or pick location manually",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ));
  }
}
