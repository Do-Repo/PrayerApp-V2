import 'package:flutter/material.dart';

class BetaBadge extends StatelessWidget {
  const BetaBadge({super.key, required this.child, this.label});
  final Widget child;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(0, 0),
      label: Text(" ${label ?? "BETA"} "),
      backgroundColor: Colors.orange,
      textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
      child: child,
    );
  }
}

class InlineBetaBadge extends StatelessWidget {
  const InlineBetaBadge({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(0, 0),
      label: Text(" ${label ?? "BETA"} "),
      backgroundColor: Colors.orange,
      textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
    );
  }
}
