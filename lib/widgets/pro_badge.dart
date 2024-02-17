import 'package:flutter/material.dart';

class ProBadge extends StatelessWidget {
  const ProBadge({super.key, required this.child, this.label});
  final Widget child;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(0, 0),
      label: Text(" ${label ?? "PRO"} "),
      backgroundColor: Theme.of(context).primaryColor,
      textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
      child: child,
    );
  }
}

class InlineProBadge extends StatelessWidget {
  const InlineProBadge({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(0, 0),
      label: Text(" ${label ?? "PRO"} "),
      backgroundColor: Theme.of(context).primaryColor,
      textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
    );
  }
}
