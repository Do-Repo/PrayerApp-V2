import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/home_structure/screens/ai_imam_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/hijri_calendar_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/home_screen.dart';
import 'package:new_prayer_app/structures/home_structure/screens/quran_screen.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tunisia, Grombalia", style: TextStyle(color: Colors.white)),
            Text(" 12:19 PM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
          ],
        ),
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [HomeScreen(), QuranScreen(), Calendar(), QiblaScreen(), Container()]),
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
              NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Qibla"),
              NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Settings"),
            ]),
      ),
    );
  }
}

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "Qibla"),
      body: Column(
        children: [],
      ),
    );
  }
}
