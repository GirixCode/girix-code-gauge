// lib/src/radial/painters/radial_gauge_painter.dart

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/linear_gauge_common_model.dart';
import 'package:girix_code_gauge/src/radial/models/radial_gauge_style.dart';

/// The [RadialGaugePainter] is used to paint the radial gauge.
///
/// The [RadialGaugePainter] class extends the [CustomPainter] class from Flutter.
///
/// The [RadialGaugePainter] class contains the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [RadialGaugeStyle] class that holds the style properties of the gauge.
///
class RadialGaugePainter extends CustomPainter {
  final GaugeValue value;
  final RadialGaugeStyle style;
  RadialGaugePainter({required this.value, required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    // Painting logic for radial gauge
  }

  @override
  bool shouldRepaint(covariant RadialGaugePainter oldDelegate) {
    return oldDelegate.value != value || oldDelegate.style != style;
  }
}
