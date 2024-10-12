// lib/src/linear/painters/linear_gauge_painter.dart

import 'package:flutter/material.dart';

import '../../common/models/gauge_value.dart';
import '../models/linear_gauge_style.dart';

/// [LinearGaugePainter] is a custom painter class that is used to paint the LinearGauge widget.
///
/// It extends the [CustomPainter] class from Flutter.
///
/// The [LinearGaugePainter] class contains the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [LinearGaugeStyle] class that holds the style properties of the gauge.
///
class LinearGaugePainter extends CustomPainter {
  final GaugeValue value;
  final LinearGaugeStyle style;

  LinearGaugePainter({required this.value, required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    // Painting logic for linear gauge
  }

  @override
  bool shouldRepaint(covariant LinearGaugePainter oldDelegate) {
    return oldDelegate.value != value || oldDelegate.style != style;
  }
}
