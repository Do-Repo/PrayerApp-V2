import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_prayer_app/structures/home_structure/screens/settings/report_problem.dart';
import 'package:new_prayer_app/widgets/beta_badge.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class AIImamScreen extends StatefulWidget {
  const AIImamScreen({super.key});

  @override
  State<AIImamScreen> createState() => _AIImamScreenState();
}

class _AIImamScreenState extends State<AIImamScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int? expandedIndex;
  bool hasAccepted = false;
  bool hideFuture = false;
  String? selectedPrayer;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(context, title: "AI Imam"),
        body: Column(
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 3))),
                ),
                IgnorePointer(
                  child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      onTap: null,
                      physics: const NeverScrollableScrollPhysics(),
                      tabs: const [
                        Text("Introduction"),
                        Text("Select prayer"),
                        Text("Additional settings"),
                        Text("Review"),
                        Text("Start")
                      ]),
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                  controller: tabController,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [introduction(), selectPrayer(), Container(), Container(), Container()]),
            ),
            const SizedBox(height: 5),
          ],
        ));
  }

  Widget introduction() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              key: ValueKey(expandedIndex),
              children: [
                const SizedBox(height: 10),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                ),
                ExpansionTile(
                  initiallyExpanded: expandedIndex == 0,
                  onExpansionChanged: (value) =>
                      (value) ? setState(() => expandedIndex = 0) : setState(() => expandedIndex = null),
                  title: const Text("Who is this for?"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                  children: const [
                    SizedBox(width: double.infinity),
                    Text(
                        "Everyone! Whether you're new to Islam and still learning how to pray, or if you already know how to pray but want to recite verses you haven't memorized yet, this feature can greatly enhance your prayer experience."),
                    SizedBox(height: 10),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: expandedIndex == 1,
                  onExpansionChanged: (value) =>
                      (value) ? setState(() => expandedIndex = 1) : setState(() => expandedIndex = null),
                  title: const Text("How does I use it?"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                  children: const [
                    SizedBox(width: double.infinity),
                    Text(
                        "Follow the instructions to set up your prayer. Then, place your phone in front of you on the floor and follow along with the prayer as the phone recites it to you.\n\nPicture your phone as your Imam, leading you through the prayer."),
                    SizedBox(height: 10)
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: expandedIndex == 2,
                  onExpansionChanged: (value) =>
                      (value) ? setState(() => expandedIndex = 2) : setState(() => expandedIndex = null),
                  title: const Text("Isn't this prohibited?"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(width: double.infinity),
                    RichText(
                        text: TextSpan(
                            text:
                                "After conducting thorough research and consulting numerous experts, we've found that this feature is not prohibited as long as it's utilized as intended.\n\nIn fact, many individuals only memorize three or four verses and recite them repeatedly during their prayers.\n\nIncorporating this feature can enhance your prayer experience and deepen your connection with Allah (SWT). For detailed instructions on how to use it, simply tap",
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: " 'How do I use it?'",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    expandedIndex = 1;
                                  });
                                },
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )),
                          const TextSpan(text: " in the FAQ section.")
                        ])),
                    const SizedBox(height: 10),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: expandedIndex == 3,
                  onExpansionChanged: (value) =>
                      (value) ? setState(() => expandedIndex = 3) : setState(() => expandedIndex = null),
                  title: const Text("What if it doesn't work?"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(width: double.infinity),
                    RichText(
                        text: TextSpan(
                            text:
                                "Should any issues occur, we advise you to continue your prayers independently.\n\nAfterward, please notify us of the problem, and we'll work diligently to resolve it promptly.\n\nYour feedback is invaluable in ensuring the best experience for all users. To report an issue, navigate to the settings and tap",
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: " 'Report a problem'",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ReportProblem()));
                                },
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )),
                          const TextSpan(text: ".")
                        ])),
                    const SizedBox(height: 10)
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                      text: const TextSpan(
                          text: "Please note that as this feature is still in its ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                        TextSpan(text: "testing phase", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ", it may undergo changes and improvements."),
                        TextSpan(
                            text: "\nWe appreciate your patience and feedback as we work to enhance your experience."),
                        TextSpan(
                            text:
                                "\n\nBy using this feature, you acknowledge and understand that there may be occasional "),
                        TextSpan(text: "bugs or inconsistencies.", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "\nYour input is invaluable in helping us shape a better experience for you and our community.")
                      ])),
                ),
                const Spacer(),
                const SizedBox(height: 15),
                CheckboxListTile(
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("I understand and am ready to continue."),
                    value: hasAccepted,
                    onChanged: (v) {
                      setState(() {
                        hasAccepted = v ?? false;
                      });
                    }),
                CheckboxListTile(
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Hide introduction next time."),
                    value: hideFuture,
                    onChanged: (v) {
                      setState(() {
                        hideFuture = v ?? false;
                      });
                    }),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                        onPressed: hasAccepted
                            ? () {
                                tabController.animateTo(1);
                              }
                            : null,
                        child: const Text("Continue")))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget selectPrayer() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Prayer selection",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                ),
                RadioListTile(
                    title: const Text("Fajr"),
                    subtitle: const Text("2 Rak'ats"),
                    groupValue: selectedPrayer,
                    value: 'Fajr',
                    onChanged: (v) {
                      setState(() {
                        selectedPrayer = v;
                      });
                    }),
                RadioListTile(
                    title: const Text("Dhuhr"),
                    subtitle: const Text("4 Rak'ats"),
                    groupValue: selectedPrayer,
                    value: 'Dhuhr',
                    onChanged: (v) {
                      setState(() {
                        selectedPrayer = v;
                      });
                    }),
                RadioListTile(
                    title: const Text("Asr"),
                    subtitle: const Text("4 Rak'ats"),
                    groupValue: selectedPrayer,
                    value: 'Asr',
                    onChanged: (v) {
                      setState(() {
                        selectedPrayer = v;
                      });
                    }),
                RadioListTile(
                    title: const Text("Maghrib"),
                    subtitle: const Text("3 Rak'ats"),
                    groupValue: selectedPrayer,
                    value: 'Maghrib',
                    onChanged: (v) {
                      setState(() {
                        selectedPrayer = v;
                      });
                    }),
                RadioListTile(
                    title: const Text("Isha'a"),
                    subtitle: const Text("4 Rak'ats"),
                    groupValue: selectedPrayer,
                    value: "Isha'a",
                    onChanged: (v) {
                      setState(() {
                        selectedPrayer = v;
                      });
                    }),
                const Spacer(),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        tabController.animateTo(0);
                      },
                      icon: const Icon(Icons.keyboard_arrow_left),
                      label: const Text("Back"),
                    ),
                    const Spacer(),
                    FilledButton(
                        onPressed: selectedPrayer != null
                            ? () {
                                tabController.animateTo(2);
                              }
                            : null,
                        child: const Text("Continue"))
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
