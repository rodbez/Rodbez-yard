import 'package:flutter/material.dart';

class VerticalStepperItem {
  final String from;
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color lineColor;

  VerticalStepperItem({
    required this.from,
    required this.title,
    required this.imagePath,
    this.backgroundColor = Colors.white,
    this.lineColor = Colors.grey,
  });
}

class VerticalStepper extends StatelessWidget {
  final List<VerticalStepperItem> steps;
  final TextStyle? textStyle;
  final double iconSize;

  const VerticalStepper({
    Key? key,
    required this.steps,
    this.textStyle,
    this.iconSize = 24.0,
  }) : super(key: key);

  double _calculateLineHeight(String text) {
    final lineCount = '\n'.allMatches(text).length + 1;

    if (lineCount >= 3) return 60;
    if (lineCount == 2) return 45;
    return 30;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final item = steps[index];
        final isLast = index == steps.length - 1;

        final fullText = '${item.from}\n${item.title}';
        final lineHeight = _calculateLineHeight(fullText);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + line column
            Column(
              children: [
                CircleAvatar(
                  radius: iconSize / 2,
                  backgroundColor: item.backgroundColor,
                  child: ClipOval(
                    child: Image.asset(
                      item.imagePath,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: lineHeight,
                    color: item.lineColor,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.from,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
