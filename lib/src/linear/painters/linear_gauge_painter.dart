// lib/src/linear/painters/linear_gauge_painter.dart

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/linear_gauge_common_model.dart';
import 'package:girix_code_gauge/src/linear/models/linear_gauge_style.dart';
import 'package:girix_code_gauge/src/linear/models/linear_needle_model.dart';
import 'package:girix_code_gauge/src/linear/utils/needle_utils.dart';

/// [LinearGaugeProgressPainter] is a custom painter class that is used to paint the GxProgressLinearGauge widget.
///
/// It extends the [CustomPainter] class from Flutter.
///
/// The [LinearGaugeProgressPainter] class contains the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [LinearGaugeStyle] class that holds the style properties of the gauge.
///
class LinearGaugeProgressPainter extends CustomPainter {
  final GaugeValue gaugeValue;
  final LinearGaugeStyle foregroundStyle;
  final LinearGaugeStyle backgroundStyle;
  final LinearNeedle needle;
  final void Function(Canvas canvas, Offset position)? customDrawNeedle;
  LinearGaugeProgressPainter({
    required this.gaugeValue,
    required this.foregroundStyle,
    required this.backgroundStyle,
    required this.needle,
    this.customDrawNeedle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the gauge
    _drawGauge(canvas, size);

    if (needle.enabled) {
      // Draw the needle
      NeedleUtils.drawNeedle(
          canvas: canvas,
          size: size,
          gaugeValue: gaugeValue,
          dense: foregroundStyle.dense,
          style: backgroundStyle,
          customDrawNeedle: customDrawNeedle,
          needle: needle);
    }
  }

  @override
  bool shouldRepaint(covariant LinearGaugeProgressPainter oldDelegate) {
    final bool shouldRepaint = oldDelegate.gaugeValue != gaugeValue ||
        oldDelegate.foregroundStyle != foregroundStyle ||
        oldDelegate.backgroundStyle != backgroundStyle ||
        oldDelegate.needle != needle;

    if (kDebugMode) {
      log('shouldRepaint:  $shouldRepaint');
    }

    return shouldRepaint;
  }

  // Draw the gauge
  void _drawGauge(Canvas canvas, Size size) {
    // Style Properties: Background
    final double thicknessBg = backgroundStyle.thickness;
    final Color backgroundColor = backgroundStyle.backgroundColor;
    final double gaugeSizeWith = size.width;
    final double sizeHeight = size.height;

    // Style Properties: Foreground
    final double thicknessFg = foregroundStyle.thickness;
    final Color foregroundColor = foregroundStyle.backgroundColor;

    // Value Properties
    final double minValue = gaugeValue.min;
    final double maxValue = gaugeValue.max;
    final double value = gaugeValue.value;

    // Draw Background
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = thicknessBg
      ..strokeCap = StrokeCap.round;

    if (backgroundStyle.dense) {
      // Draw the background line (full width)
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        backgroundPaint,
      );
    } else {
      final Rect rect = Rect.fromLTWH(0, 0, gaugeSizeWith, sizeHeight);
      final RRect rrect = RRect.fromRectAndRadius(
          rect, backgroundStyle.radius ?? const Radius.circular(10));
      canvas.drawRRect(rrect, backgroundPaint);
    }

    // Draw Foreground
    final Paint foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = thicknessFg
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square;
    // Calculate progress ratio
    final double progress =
        ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);

    if (foregroundStyle.dense) {
      // Draw the progress line
      // P2 x: (size.width * progress) this value can be used directly
      // P1 x: (size.width * progress) - (foregroundStyle.thickness / 2) due to the thickness provided
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset((size.width * progress) - (foregroundStyle.thickness / 2),
            size.height / 2),
        foregroundPaint,
      );
    } else {
      final double frontWidth = progress * gaugeSizeWith;
      if (kDebugMode) {
        log('frontWidth: $frontWidth and progress: $progress and gaugeSizeWith: $gaugeSizeWith');
      }

      /// here left padding is -5 to make the progress bar start from the beginning
      final Rect valueRect = Rect.fromLTWH(0, 0, frontWidth, sizeHeight);
      final RRect valueRRect = RRect.fromRectAndRadius(
          valueRect, foregroundStyle.radius ?? const Radius.circular(10));

      canvas.drawRRect(valueRRect, foregroundPaint);
    }
  }
}
