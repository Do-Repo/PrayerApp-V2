import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/home_structure/screens/ai_imam_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/hijri_calendar_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/home_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/quran_screen.dart';

class HomeStructure extends StatefulWidget {
  const HomeStructure({super.key});

  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    super.initState();
  }

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
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [HomeScreen(), QuranScreen(), Calendar(), AIImamScreen(), Container()]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black12))),
        child: NavigationBar(
            elevation: 0,
            selectedIndex: _tabController.index,
            onDestinationSelected: (value) => _tabController.animateTo(value),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(icon: Icon(Icons.book_outlined), label: "Quran"),
              NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: "Hijri"),
              NavigationDestination(icon: Icon(Icons.settings_outlined), label: "AI Imam"),
              NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Settings"),
            ]),
      ),
    );
  }
}
