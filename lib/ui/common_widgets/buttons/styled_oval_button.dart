import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class StyledOvalButton extends ConsumerWidget {
  const StyledOvalButton({
    this.label,
    this.percentWidth = .9,
    this.widthBreakPoint = 400,
    this.percentHeight = 0.15,
    this.heightMin = 20,
    this.heightMax = 50,
    required this.onPressed,
    super.key,
  });

  final String? label;
  final double percentWidth;
  final double widthBreakPoint;
  final double percentHeight;
  final double heightMin;
  final double heightMax;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double doublePercentHeight =
        doubleByPercentHeight(context, percentHeight);

    print(widthBreakPoint);
    print(doubleByPercentWidth(context, percentWidth));

    return SizedBox(
      width: doubleByPercentWidth(context, percentWidth) > widthBreakPoint
          ? widthBreakPoint
          : doubleByPercentWidth(context, percentWidth),
      height: heightMin > doublePercentHeight
          ? heightMin
          : heightMax < doublePercentHeight
              ? heightMax
              : doublePercentHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: label == null ? null : Text(label!),
      ),
    );
  }
}
