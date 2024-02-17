import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_prayer_app/widgets/continue_button.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class IntroLanguage extends StatefulWidget {
  const IntroLanguage({super.key});

  @override
  State<IntroLanguage> createState() => _IntroLanguageState();
}

class _IntroLanguageState extends State<IntroLanguage> with TickerProviderStateMixin {
  late AnimationController _controller;
  final _scrollController = ScrollController();
  bool animationDone = false;
  bool isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Lottie.asset("assets/lottie/bismillah.json", controller: _controller, repeat: false, onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() {
                setState(() {
                  animationDone = true;
                });
              });
          }),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (animationDone)
                    Flexible(
                      child: WidgetAnimator(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: Theme.of(context).colorScheme.outline),
                              borderRadius: BorderRadius.circular(30)),
                          child: AnimatedSize(
                            duration: Durations.short4,
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isExpanded)
                                  Flexible(
                                    child: Scrollbar(
                                      controller: _scrollController,
                                      thumbVisibility: true,
                                      child: ListView(
                                        controller: _scrollController,
                                        shrinkWrap: true,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/united-arab-emirates.png',
                                                    height: 30, width: 30),
                                                const SizedBox(width: 10),
                                                const Text(
                                                  "العربية",
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/netherlands.png', height: 30, width: 30),
                                                const SizedBox(width: 10),
                                                const Text(
                                                  "Nederlands",
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/spain.png', height: 30, width: 30),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Español",
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/turkey.png', height: 30, width: 30),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Türkçe",
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/russia.png', height: 30, width: 30),
                                                const SizedBox(width: 10),
                                                const Text(
                                                  "русский",
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (isExpanded) const Divider(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/united-kingdom.png', height: 30, width: 30),
                                      const SizedBox(width: 10),
                                      const Text(
                                        "English",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                      ),
                                      const Spacer(),
                                      Icon(!isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (animationDone)
                    ContinueButton(
                      text: "Continue",
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    )
                ],
              ))
        ],
      ),
    );
  }
}
