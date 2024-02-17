import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/pro_badge.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({super.key});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _controller = ScrollController();
  bool showBorder = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (showBorder == false) {
        if ((_controller.offset != _controller.initialScrollOffset)) {
          setState(() => showBorder = true);
        }
      }

      if (showBorder == true) {
        if ((_controller.offset == _controller.initialScrollOffset)) {
          setState(() => showBorder = false);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        controller: _controller,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
              title: const Text("Add Event"),
              titleSpacing: 0,
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              actions: [
                IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
                const SizedBox(width: 10)
              ],
              bottom: showBorder
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(1.0),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        height: 1.0,
                      ),
                    )
                  : null),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Event name"),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Description"),
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Importance",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      FilterChip(
                        onSelected: (v) {},
                        label: const Text("Not important"),
                        avatar: const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 15),
                      FilterChip(
                        onSelected: (v) {},
                        label: const Text("Important"),
                        avatar: const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 15),
                      FilterChip(
                        onSelected: (v) {},
                        label: const Text("Very important"),
                        avatar: const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 15)
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "From",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Date", suffixIcon: Icon(Icons.arrow_drop_down)),
                      )),
                      SizedBox(width: 15),
                      Flexible(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Time", suffixIcon: Icon(Icons.arrow_drop_down)),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "To",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Date", suffixIcon: Icon(Icons.arrow_drop_down)),
                      )),
                      SizedBox(width: 15),
                      Flexible(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Time", suffixIcon: Icon(Icons.arrow_drop_down)),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.notification_add_outlined),
                      const SizedBox(width: 15),
                      const Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Set reminder",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(width: 15),
                                  InlineProBadge()
                                ],
                              ),
                              AutoSizeText(
                                "Get notified 10 minuntes before the event",
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                                maxFontSize: 13,
                                minFontSize: 10,
                                maxLines: 1,
                              ),
                            ],
                          )),
                      Switch(value: false, onChanged: (v) {}),
                    ],
                  ),
                ),
                const SizedBox(height: 15)
              ],
            ),
          )
        ],
      ),
    );
  }
}
