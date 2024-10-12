// lib/src/linear/widgets/linear_gauge.dart

import 'package:flutter/material.dart';

import '../../common/models/gauge_value.dart';
import '../models/linear_gauge_style.dart';
import '../painters/linear_gauge_painter.dart';

/// The [LinearGauge] widget is used to display a linear gauge.
///
/// The [LinearGauge] widget requires the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [LinearGaugeStyle] class that holds the style properties of the gauge.
///
class LinearGauge extends StatelessWidget {
  final GaugeValue value;
  final LinearGaugeStyle style;

  const LinearGauge({super.key, required this.value, required this.style});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: style.size,
      painter: LinearGaugePainter(value: value, style: style),
    );
  }
}
