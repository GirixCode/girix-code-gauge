// lib/src/linear/models/linear_gauge_style.dart

import 'package:flutter/material.dart';

/// [LinearGaugeStyle] is a class that holds the style properties for the LinearGauge widget.
///
/// It contains the following properties:
/// - [size]: The size of the LinearGauge widget. It is a required property.
///
/// - [backgroundColor]: The background color of the LinearGauge widget. It is set to Colors.grey by default.
///
/// - [foregroundColor]: The foreground color of the LinearGauge widget. It is set to Colors.blue by default.
///
/// - [thickness]: The thickness of the LinearGauge widget. It is set to 10.0 by default.
///
class LinearGaugeStyle {
  final Size size;
  final Color backgroundColor;
  final Color foregroundColor;
  final double thickness;

  LinearGaugeStyle({
    required this.size,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
    this.thickness = 10.0,
  });
}
