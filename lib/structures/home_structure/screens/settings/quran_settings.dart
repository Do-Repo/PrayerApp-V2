import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';
import 'package:new_prayer_app/widgets/pro_badge.dart';

class QuranSettings extends StatefulWidget {
  const QuranSettings({super.key});

  @override
  State<QuranSettings> createState() => _QuranSettingsState();
}

class _QuranSettingsState extends State<QuranSettings> {
  double fontSize = 15;
  double volume = 8;

  FontWeight fontWeight = FontWeight.normal;
  final fonts = [
    "Roboto",
    "Rubik",
    "Cairo",
    "Amiri Quran",
    "Tajawal",
    "Changa",
    "Amiri",
    "El Messiri",
    "Readex Pro",
    "Mada",
    "Reem Kufi",
    "Lemonada",
    "Markazi Text",
    "Lateef",
    "Noto Nastaliq Urdu",
    "Kufam",
    "Aref Ruqaa",
    "Harmattan",
    "Ruwudu",
    "Gulzar"
  ];
  String selectedFont = "Roboto";
  String selectedReciter = "0";

  late Future _googleFontsPending;

  @override
  void initState() {
    _googleFontsPending = GoogleFonts.pendingFonts([GoogleFonts.getFont(selectedFont)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: "Quran settings",
        hideBorder: true,
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          titleSpacing: 10,
          title: Text("Text settings"),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Example",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              FutureBuilder(
                  future: _googleFontsPending,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container(
                        constraints: const BoxConstraints(maxHeight: 200),
                      );
                    }
                    return Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                        child: Text(
                          "النية سبعون جزءاً من العبادة",
                          style: GoogleFonts.getFont(selectedFont).copyWith(fontSize: fontSize, fontWeight: fontWeight),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                  }),
              const Divider(height: 1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Font size",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 10),
                  Slider(
                    value: fontSize,
                    label: fontSize.round().toString(),
                    onChanged: (v) {
                      setState(() {
                        fontSize = v;
                      });
                    },
                    min: 8,
                    max: 70,
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Font weight",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Radio(
                            value: FontWeight.normal,
                            groupValue: fontWeight,
                            onChanged: (v) {
                              setState(() {
                                fontWeight = v!;
                              });
                            }),
                        const Text("Normal")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Radio(
                            value: FontWeight.bold,
                            groupValue: fontWeight,
                            onChanged: (v) {
                              setState(() {
                                fontWeight = v!;
                              });
                            }),
                        const Text("Bold")
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Font style",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: DropdownButtonFormField(
                      value: selectedFont,
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      items: fonts
                          .map((key) => DropdownMenuItem(
                              value: key,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(key),
                                  const SizedBox(width: 10),
                                  if (fonts.indexOf(key) > 2) const InlineProBadge()
                                ],
                              )))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          selectedFont = v!;
                          _googleFontsPending = GoogleFonts.pendingFonts([GoogleFonts.getFont(selectedFont)]);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          titleSpacing: 10,
          title: Text("Audio settings"),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Volume",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: volume,
              label: volume.round().toString(),
              onChanged: (v) {
                setState(() {
                  volume = v;
                });
              },
              min: 0,
              max: 10,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Voice",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Change",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Mohamed Abu"),
              subtitle: Text("Weld Moni Doudi"),
              leading: CircleAvatar(),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
                ],
              ),
            )
          ],
        ))
      ]),
    );
  }
}
