import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/home_structure/home_structure.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        sliderTheme: const SliderThemeData(showValueIndicator: ShowValueIndicator.always),
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.light, seedColor: const Color(0XFF1E555C)),
        useMaterial3: true,
      ),
      home: const HomeStructure(),
    );
  }
}
