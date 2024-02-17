import 'package:flutter/material.dart';
import 'package:new_prayer_app/models/quran_model.dart';
import 'package:new_prayer_app/my_flutter_app_icons.dart';
import 'package:new_prayer_app/services/quran_services.dart';
import 'package:new_prayer_app/structures/home_structure/screens/surah_screen.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late Future<List<QuranChapter>?> future;
  @override
  void initState() {
    future = QuranServices.listChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          title: "Quran", actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))]),
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return WidgetAnimator(
                      child: Container(
                        color: (index.isOdd) ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
                        child: ListTile(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SurahScreen())),
                          leading: (snapshot.data![index].revelation_place == 'makkah')
                              ? Icon(
                                  MyFlutterApp.kaaba,
                                  size: 25,
                                )
                              : SizedBox(
                                  width: 25,
                                ),
                          title: Row(
                            children: [
                              Text(
                                snapshot.data![index].name_simple.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              Spacer(),
                              Text(
                                snapshot.data![index].name_arabic.toString(),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text("Verses: ${snapshot.data![index].verses_count.toString()}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return const LinearProgressIndicator();
            }
          }),
    );
  }
}
