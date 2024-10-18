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
        _isBarPointersChanged(oldDelegate.barPointers) ||
        direction != oldDelegate.direction ||
        gapBetweenBars != oldDelegate.gapBetweenBars ||
        needle != oldDelegate.needle ||
        showNeedleInsideBar != oldDelegate.showNeedleInsideBar;
  }

  void _drawBars(
    Canvas canvas,
    Size size,
  ) {
    // Gauge Value
    final double minValue = gaugeValue.min;
    final double maxValue = gaugeValue.max;
    final double height = size.height;
    final double width = size.width;

    log('GxLinearBarGauge: Size: $size, minValue: $minValue, maxValue: $maxValue');
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
      log('GxLinearBarGauge: Bar Value: $barToDrawnValue => $barToDrawnWidth and Gap $gapBetweenBars => $gapValue');

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

      log('GxLinearBarGauge: ======================$index======================');

      // Text label and style

      if (barPointer.label != null) {
        final GaugeLabel label = barPointer.label!;
        final TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: label.label,
              style: label.style,
            ),
            textDirection: TextDirection.rtl,
            textAlign: barPointer.label?.textAlign ?? TextAlign.center);

        textPainter.layout();
        final double textWidth = textPainter.width;
        final double textHeight = textPainter.height;

        double textX = barRect.left + (barRect.width - textWidth) / 2;
        double textY = barRect.top + (barRect.height - textHeight) / 2;

        if (barPointer.label!.offset != null) {
          textX += barPointer.label!.offset!.dx;
          textY += barPointer.label!.offset!.dy;
          log('GxLinearBarGauge: Text Offset: $textX, $textY');
        } else {
          switch (barPointer.label!.textAlign!) {
            case TextAlign.center:
            case TextAlign.justify:
              break;
            case TextAlign.left:
              textX = barRect.left;
              break;
            case TextAlign.right:
              textX = barRect.right - textWidth;
              break;

            case TextAlign.start:
              textY = 5;
              break;
            case TextAlign.end:
              textY = barRect.height - textHeight - 5;
              break;
          }
        }

        log('GxLinearBarGauge: Text: $textX, $textY=>');

        textPainter.paint(canvas, Offset(textX, textY));
      }
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
              log('GxLinearBarGauge: Needle Value: $needleValue is inside the gap range');
              needleValue += gapBetweenBars;
              break;
            }
          }
        }
      }

      log('GxLinearBarGauge: Needle Value: $needleValue');

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

  // Check List of BarPointers changes
  bool _isBarPointersChanged(List<LinearBarPointer> oldBarPointers) {
    if (barPointers.length != oldBarPointers.length) {
      return true;
    }

    for (int index = 0; index < barPointers.length; index++) {
      final LinearBarPointer barPointer = barPointers[index];
      final LinearBarPointer oldBarPointer = oldBarPointers[index];

      if (barPointer.value != oldBarPointer.value ||
          barPointer.color != oldBarPointer.color ||
          barPointer.thickness != oldBarPointer.thickness ||
          barPointer.position != oldBarPointer.position ||
          barPointer.offset != oldBarPointer.offset ||
          barPointer.radius != oldBarPointer.radius ||
          barPointer.paintingStyle != oldBarPointer.paintingStyle ||
          barPointer.strokeCap != oldBarPointer.strokeCap ||
          barPointer.label != oldBarPointer.label) {
        return true;
      }
    }

    return false;
  }
}
