// lib/src/radial/widgets/radial_gauge.dart

import 'package:flutter/material.dart';
import 'package:girix_shape/src/common/models/linear_gauge_common_model.dart';
import 'package:girix_shape/src/radial/models/radial_gauge_style.dart';
import 'package:girix_shape/src/radial/painters/radial_gauge_painter.dart';

/// The [RadialGauge] widget is used to display a radial gauge.
///
/// The [RadialGauge] widget requires the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [RadialGaugeStyle] class that holds the style properties of the gauge.
///
/// ```dart
/// RadialGauge(
///  value: GaugeValue(value: 50, valueColor: Colors.blue),
/// style: RadialGaugeStyle(size: Size(200, 200)),
/// )
class RadialGauge extends StatelessWidget {
  final GaugeValue value;
  final RadialGaugeStyle style;
  const RadialGauge({super.key, required this.value, required this.style});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: style.size,
      painter: RadialGaugePainter(value: value, style: style),
    );
  }
}
