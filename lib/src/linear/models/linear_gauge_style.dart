// lib/src/linear/models/linear_gauge_style.dart

import 'package:flutter/material.dart';

/// [LinearGaugeStyle] is a class that holds the style properties for the ProgressLinearGauge widget.
///
/// It contains the following properties:
/// - [size]: The size of the ProgressLinearGauge widget. It is a required property.
///
/// - [backgroundColor]: The background color of the ProgressLinearGauge widget. It is set to Colors.grey by default.
///
/// - [foregroundColor]: The foreground color of the ProgressLinearGauge widget. It is set to Colors.blue by default.
///
/// - [thickness]: The thickness of the ProgressLinearGauge widget. It is set to 10.0 by default.
///
/// - [dense]: A boolean value that determines if the ProgressLinearGauge widget is dense. It is set to true by default.
class LinearGaugeStyle {
  final Size size;
  final Color backgroundColor;
  final Color foregroundColor;
  final double thickness;

  /// [dense] is true then Height will be ignored
  final bool dense;

  /// [radius] is the radius of the ProgressLinearGauge widget. It is set to 10 by default.
  final Radius? radius;

  LinearGaugeStyle({
    required this.size,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
    this.thickness = 10.0,
    this.dense = true,
    this.radius = const Radius.circular(10),
  });
}
