import 'package:flutter/material.dart';
import 'package:new_prayer_app/current_time_card.dart';
import 'package:new_prayer_app/timings_card.dart';

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
        centerTitle: false,
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CurrentTimeCard(),
                TimingsCard(),
              ],
            ),
          ),
        ),
        SliverAppBar(
          centerTitle: false,
          pinned: true,
          title: Text("Newsfeed"),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/gaza.jpeg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Millions of Palestinians left homeless",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      "Post oct 7 Israel had destoryed thousands of civilian buildings and killed over 80000 civilians. The aggression triggered multiple countries",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
