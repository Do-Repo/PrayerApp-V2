import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/intro_structure/screens/intro_language_screen.dart';
import 'package:new_prayer_app/structures/intro_structure/screens/intro_location_screen.dart';
import 'package:new_prayer_app/structures/intro_structure/screens/intro_signup_screen.dart';

class IntroStructure extends StatefulWidget {
  const IntroStructure({super.key});

  @override
  State<IntroStructure> createState() => _IntroStructureState();
}

class _IntroStructureState extends State<IntroStructure> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        controller: _controller,
        children: [
          const IntroLanguage(),
          const IntroLocation(),
          const IntroSignup(),
        ],
      ),
    ));
  }
}
