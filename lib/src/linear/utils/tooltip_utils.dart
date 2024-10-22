import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/models.dart';

class TooltipUtils {
  static void drawTooltip(
      {required Canvas canvas,
      required Size size,
      required GaugeTooltip tooltip,
      required double minValue,
      required double maxValue,
      required double value}) {
    final double progress =
        ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);

    final Color strokeColor = tooltip.borderColor ?? tooltip.color;

    final Paint paint = Paint()
      ..color = tooltip.paintingStyle == PaintingStyle.stroke
          ? strokeColor
          : tooltip.color
      ..strokeWidth = tooltip.thickness
      ..strokeCap = tooltip.strokeCap
      ..style = tooltip.paintingStyle;

    // Tooltip Size
    final double tooltipWidth = tooltip.size.width;
    final double tooltipHeight = tooltip.size.height;

    // Tooltip Position in ---X----
    final double tooltipX = size.width * progress;
    //                     |
    // Tooltip Position in Y
    //                     |
    double tooltipY = size.height / 2;

    Offset tooltipBarStart = Offset(tooltipX, 0);
    Offset tooltipBarEnd = Offset(tooltipX, 0);

    if (tooltip.position == GaugeTooltipPosition.top) {
      tooltipY = -size.height / 2 - tooltip.offset;
      tooltipBarEnd = Offset(tooltipX, tooltipY + tooltipHeight / 2);
    } else if (tooltip.position == GaugeTooltipPosition.bottom) {
      tooltipY = size.height + size.height / 2 + tooltip.offset;
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
      tooltip.radius ?? Radius.zero,
    );

    canvas.drawRRect(rRect, paint);

    log('GxLinearBarGauge: Tooltip Bar: TooltipX:-> $tooltipX, ToolTipY:-> $tooltipY, tooltipBarStart:-> $tooltipBarStart, tooltipBarEnd:-> $tooltipBarEnd, Size:-> $size');
    if (tooltip.type == GaugeTooltipType.normal) {
      canvas.drawLine(
          tooltipBarStart,
          tooltipBarEnd,
          Paint()
            ..color = strokeColor
            ..strokeCap = tooltip.strokeCap
            ..strokeWidth = tooltip.thickness);
    }

    // Based on the Tooltip Size, we can adjust the Text Size
    final double textSize =
        tooltip.textStyle?.fontSize ?? tooltip.size.width / 4;
    final Color textColor = tooltip.textStyle?.color ?? strokeColor;

    // Draw Tooltip Text
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: value.toString(),
          style: tooltip.textStyle?.copyWith(
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
