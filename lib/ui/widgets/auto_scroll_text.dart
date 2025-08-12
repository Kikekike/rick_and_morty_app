import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';

class AutoScrollText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const AutoScrollText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: style.fontSize! + 6,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textPainter = TextPainter(
            text: TextSpan(text: text, style: style),
            maxLines: 1,
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);

          final isOverflowing = textPainter.didExceedMaxLines;

          return SizedBox(
            height: style.fontSize! + 6,
            width: constraints.maxWidth,
            child: isOverflowing
                ? Marquee(
                    text: text,
                    style: style,
                    blankSpace: 30,
                    velocity: 30,
                    pauseAfterRound: const Duration(seconds: 1),
                  )
                : Text(
                    text,
                    style: style,
                    overflow: TextOverflow.ellipsis,
                  ),
          );
        },
      ),
    );
  }
}
