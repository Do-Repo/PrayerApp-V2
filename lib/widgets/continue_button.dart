import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/widget_animator.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, required this.text, this.leading, this.trailing, required this.onTap});
  final String text;
  final Widget? leading, trailing;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              if (leading != null) SizedBox.square(dimension: 30, child: leading),
              const SizedBox(width: 10),
              Flexible(
                  fit: FlexFit.tight,
                  child: AutoSizeText(
                    text,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    maxFontSize: 18,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              if (trailing != null) SizedBox.square(dimension: 30, child: trailing),
            ],
          ),
        ),
      ),
    );
  }
}
