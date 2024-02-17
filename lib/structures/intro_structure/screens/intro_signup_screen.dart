import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/continue_button.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class IntroSignup extends StatelessWidget {
  const IntroSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text("Save your settings"),
        titleSpacing: 0,
        leading: const Icon(Icons.cloud_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            WidgetAnimator(
              child: Text(
                "Save your settings and personalise your experience by syncing your IslamApp with Google",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Spacer(),
            ContinueButton(
                text: "Sign in with Google",
                leading: Image.asset("assets/images/google.png", height: 30, width: 30),
                onTap: () {}),
            SizedBox(height: 20),
            WidgetAnimator(
              child: Text(
                "Maybe later",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
