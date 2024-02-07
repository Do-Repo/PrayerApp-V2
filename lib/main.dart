import 'package:flutter/material.dart';
import 'package:new_prayer_app/timings_card.dart';
import 'package:new_prayer_app/widget_animator.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF1E555C)),
        useMaterial3: true,
      ),
      home: const HomeStructure(),
    );
  }
}

class HomeStructure extends StatelessWidget {
  const HomeStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tunisia, Grombalia"),
            Text(" 12:19 PM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "Quran"),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
      ]),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        children: [
          SizedBox(height: 10),
          CurrentTimeCard(),
          TimingsCard(),
        ],
      ),
    );
  }
}

class CurrentTimeCard extends StatelessWidget {
  const CurrentTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black12,
          width: 1,
        ),
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
