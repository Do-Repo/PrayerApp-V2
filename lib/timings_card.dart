import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:new_prayer_app/widget_animator.dart';

class TimingsCard extends StatefulWidget {
  const TimingsCard({
    super.key,
  });

  @override
  State<TimingsCard> createState() => _TimingsCardState();
}

class _TimingsCardState extends State<TimingsCard> with SingleTickerProviderStateMixin {
  TextStyle timingsStyle = const TextStyle(fontSize: 17);
  final _pageController = PageController();
  final List<PageController> _controllers = [];

  @override
  void initState() {
    _controllers.addAll(List.generate(6, (index) => PageController()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ExpandablePageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(4, (index) => dateSection(index))),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        _pageController.nextPage(duration: Durations.long1, curve: Curves.easeInOut);
                        for (var controller in _controllers) {
                          await Future.delayed(Durations.short1);
                          controller.nextPage(duration: Durations.long1, curve: Curves.easeInOut);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              const Divider(),
              Column(children: _controllers.map((controller) => prayerTimeSection(controller)).toList()),
            ],
          ),
        ),
      ),
    );
  }

  IntrinsicHeight prayerTimeSection(PageController pageController) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 8),
              child: ExpandablePageView(
                controller: pageController,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Imsak", style: timingsStyle),
                        const Spacer(),
                        Text("05:43", style: timingsStyle)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
    );
  }

  Widget dateSection(int index) {
    return Row(
      children: [
        (index == 0)
            ? const Icon(Icons.calendar_month_outlined, size: 35)
            : IconButton(
                onPressed: () async {
                  _pageController.previousPage(duration: Durations.long1, curve: Curves.easeInOut);
                  for (var controller in _controllers) {
                    await Future.delayed(Durations.short1);
                    controller.previousPage(duration: Durations.long1, curve: Curves.easeInOut);
                  }
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "24 Monday, January 2022",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, height: 0),
            ),
            Text(
              "20 Jumada al-akhirah 1443",
              style: TextStyle(fontSize: 12, height: 0),
            ),
          ],
        )
      ],
    );
  }
}
