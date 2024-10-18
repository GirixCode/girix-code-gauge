import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';
import 'package:girix_code_gauge/src/linear/painters/needle_utils.dart';

class LinearBarPainter extends CustomPainter {
  final GaugeValue gaugeValue;
  final List<LinearBarPointer> barPointers;
  final LinearGaugeDirection direction;
  final double gapBetweenBars;
  final LinearNeedle? needle;
  final bool showNeedleInsideBar;
  LinearBarPainter({
    required this.gaugeValue,
    required this.barPointers,
    required this.direction,
    this.gapBetweenBars = 0,
    this.needle,
    this.showNeedleInsideBar = true,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // draw the gauge
    if (barPointers.isNotEmpty) {
      _drawBars(canvas, size);
    }

    _drawNeedle(canvas, size);
  }

  @override
  bool shouldRepaint(covariant LinearBarPainter oldDelegate) {
    return gaugeValue != oldDelegate.gaugeValue ||
        barPointers != oldDelegate.barPointers;
  }

  void _drawBars(
    Canvas canvas,
    Size size,
  ) {
    // Gauge Value
    final double minValue = gaugeValue.min;
    final double maxValue = gaugeValue.max;
    final double currentValue = gaugeValue.value;
    final double height = size.height;
    final double width = size.width;

    log('LinearBarGauge: Size: $size, minValue: $minValue, maxValue: $maxValue');
    double startValue = minValue;
    final double gapValue = (gapBetweenBars / maxValue) * width;

    for (int index = 0; index < barPointers.length; index++) {
      final LinearBarPointer barPointer = barPointers[index];
      final double barToDrawnValue = barPointer.value;

      final Paint paintAxis = Paint()
        ..color = barPointer.color
        ..strokeWidth = barPointer.thickness
        ..strokeCap = barPointer.strokeCap
        ..style = barPointer.paintingStyle;
      double barToDrawnWidth = (barToDrawnValue / maxValue) * width;
      log('LinearBarGauge: Bar Value: $barToDrawnValue => $barToDrawnWidth and Gap $gapBetweenBars => $gapValue');

      //Allowing the bar to be drawn with a gap between them
      final bool isGap =
          gapBetweenBars > 0 && index > 0 && index < barPointers.length;
      if (isGap) {
        startValue += gapValue / 2;
        barToDrawnWidth -= gapValue / 2;
      }

      final Rect barRect = Rect.fromLTWH(
        startValue,
        0,
        barToDrawnWidth,
        height,
      );

      final RRect rRect = RRect.fromRectAndRadius(
        barRect,
        barPointer.radius ?? Radius.zero,
      );

      canvas.drawRRect(rRect, paintAxis);
      startValue += barToDrawnWidth;

      log('LinearBarGauge: ======================$index======================');
    }
  }

  void _drawNeedle(
    Canvas canvas,
    Size size,
  ) {
    if (needle != null && needle!.enabled) {
      double needleValue = gaugeValue.value;

      // Gap Value
      if (gapBetweenBars > 0 && showNeedleInsideBar) {
        // Find out the no of gaps between bars
        final int noOfGaps = barPointers.length - 1;

        // Check whether the needleValue is inside the gap range
        if (noOfGaps > 0) {
          for (int index = 0; index < noOfGaps; index++) {
            final double startValue = barPointers[index].value;
            final double endValue = startValue + gapBetweenBars;

            if (needleValue > startValue && needleValue < endValue) {
              log('LinearBarGauge: Needle Value: $needleValue is inside the gap range');
              needleValue += gapBetweenBars;
              break;
            }
          }
        }
      }

      log('LinearBarGauge: Needle Value: $needleValue');

      // Draw the needle
      NeedleUtils.drawIt(
        canvas: canvas,
        size: size,
        maxValue: gaugeValue.max,
        minValue: gaugeValue.min,
        thickness: needle!.offset,
        value: needleValue,
        needle: needle!,
      );
    }
  }
}
