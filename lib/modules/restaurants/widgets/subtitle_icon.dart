import 'package:flutter/material.dart';

class SubtitleIcon extends StatelessWidget {
  const SubtitleIcon({
    super.key,
    required this.subtitle,
    required this.icons,
    required this.iconColor,
  });

  final String subtitle;
  final IconData icons;
  final MaterialColor iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          size: 16,
          color: iconColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
