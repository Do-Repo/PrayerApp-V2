import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context,
    {required String title, List<Widget>? actions, double? titleSpacing, bool? hideBorder}) {
  return AppBar(
      title: Text(title),
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: actions,
      centerTitle: false,
      titleSpacing: titleSpacing,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      bottom: (hideBorder ?? false)
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 1.0,
              ),
            ));
}
