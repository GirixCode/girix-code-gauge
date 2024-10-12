// lib/src/radial/models/radial_gauge_style.dart

import 'package:flutter/material.dart';

/// [RadialGaugeStyle] is a class that holds the style properties for the RadialGauge widget.
///
/// It contains the following properties:
///
/// - [size]: The size of the RadialGauge widget. It is a required property.
///
/// - [backgroundColor]: The background color of the RadialGauge widget. It is set to Colors.grey by default.
///
/// - [foregroundColor]: The foreground color of the RadialGauge widget. It is set to Colors.blue by default.
///
/// - [strokeWidth]: The stroke width of the RadialGauge widget. It is set to 10.0 by default.
///
class RadialGaugeStyle {
  final Size size;
  final Color backgroundColor;
  final Color foregroundColor;
  final double strokeWidth;

  RadialGaugeStyle({
    required this.size,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
    this.strokeWidth = 10.0,
  });
}
