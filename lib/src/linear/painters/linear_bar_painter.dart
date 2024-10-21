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
  final GaugeTooltip? tooltip;
  LinearBarPainter({
    required this.gaugeValue,
    required this.barPointers,
    required this.direction,
    this.gapBetweenBars = 0,
    this.needle,
    this.showNeedleInsideBar = true,
    this.tooltip,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // draw the gauge
    if (barPointers.isNotEmpty) {
      _drawBars(canvas, size);
    }

    _drawNeedle(canvas, size);

    // Draw Tooltip
    _drawTooltip(canvas, size);
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

  // Draw Tooltip
  void _drawTooltip(
    Canvas canvas,
    Size size,
  ) {
    if (tooltip != null && tooltip!.enabled) {
      final double minValue = gaugeValue.min;
      final double maxValue = gaugeValue.max;
      final double value = gaugeValue.value;

      final double progress =
          ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);

      final Color strokeColor = tooltip!.borderColor ?? tooltip!.color;

      final Paint paint = Paint()
        ..color = tooltip!.paintingStyle == PaintingStyle.stroke
            ? strokeColor
            : tooltip!.color
        ..strokeWidth = tooltip!.thickness
        ..strokeCap = tooltip!.strokeCap
        ..style = tooltip!.paintingStyle;

      // Tooltip Size
      final double tooltipWidth = tooltip!.size.width;
      final double tooltipHeight = tooltip!.size.height;

      // Tooltip Position in ---X----
      final double tooltipX = size.width * progress;
      //                     |
      // Tooltip Position in Y
      //                     |
      double tooltipY = size.height / 2;

      Offset tooltipBarStart = Offset(tooltipX, 0);
      Offset tooltipBarEnd = Offset(tooltipX, 0);

      if (tooltip!.position == GaugeTooltipPosition.top) {
        tooltipY = -size.height / 2 - tooltip!.offset;
        tooltipBarEnd = Offset(tooltipX, tooltipY + tooltipHeight / 2);
      } else if (tooltip!.position == GaugeTooltipPosition.bottom) {
        tooltipY = size.height + size.height / 2 + tooltip!.offset;
        tooltipBarStart = Offset(tooltipX, size.height);
        tooltipBarEnd = Offset(tooltipX, tooltipY - tooltipHeight / 2);
      }

      final Rect tooltipRect = Rect.fromLTWH(
        tooltipX - tooltipWidth / 2,
        tooltipY - tooltipHeight / 2,
        tooltipWidth,
        tooltipHeight,
      );

      final RRect rRect = RRect.fromRectAndRadius(
        tooltipRect,
        tooltip!.radius ?? Radius.zero,
      );

      canvas.drawRRect(rRect, paint);

      log('GxLinearBarGauge: Tooltip Bar: TooltipX:-> $tooltipX, ToolTipY:-> $tooltipY, tooltipBarStart:-> $tooltipBarStart, tooltipBarEnd:-> $tooltipBarEnd, Size:-> $size');
      if (tooltip!.type == GaugeTooltipType.normal) {
        canvas.drawLine(
            tooltipBarStart,
            tooltipBarEnd,
            Paint()
              ..color = strokeColor
              ..strokeWidth = tooltip!.thickness);
      }

      // Based on the Tooltip Size, we can adjust the Text Size
      final double textSize =
          tooltip?.textStyle?.fontSize ?? tooltip!.size.width / 4;
      final Color textColor = tooltip?.textStyle?.color ?? strokeColor;

      // Draw Tooltip Text
      final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: value.toString(),
            style: tooltip?.textStyle?.copyWith(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center);

      textPainter.layout();
      final double textWidth = textPainter.width;
      final double textHeight = textPainter.height;

      final double textX = tooltipX - textWidth / 2;
      final double textY = tooltipY - textHeight / 2;

      textPainter.paint(canvas, Offset(textX, textY));
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
