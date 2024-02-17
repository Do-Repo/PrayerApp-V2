import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_prayer_app/structures/home_structure/screens/settings/quran_settings.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';
import 'package:new_prayer_app/widgets/pro_badge.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(context, title: "Surah name", titleSpacing: 0, actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuranSettings()));
              },
              icon: Icon(Icons.settings_outlined)),
        ]),
        body: Column(
          children: [],
        ));
  }
}
