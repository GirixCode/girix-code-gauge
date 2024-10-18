// lib/src/linear/widgets/linear_gauge.dart

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/linear_gauge_common_model.dart';
import 'package:girix_code_gauge/src/linear/models/linear_gauge_style.dart';
import 'package:girix_code_gauge/src/linear/models/linear_needle_model.dart';
import 'package:girix_code_gauge/src/linear/painters/linear_gauge_painter.dart';

/// The [GxProgressLinearGauge] widget is used to display a linear gauge.
///
/// The [GxProgressLinearGauge] widget requires the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [LinearGaugeStyle] class that holds the style properties of the gauge.
///
/// - [shape]: An instance of the [LinearGaugeShape] enum that holds the shape of the gauge.
///
/// - [needle]: An instance of the [LinearNeedle] class that holds the needle properties of the Needle.
class GxProgressLinearGauge extends StatelessWidget {
  final GaugeValue value;
  final LinearGaugeStyle? foregroundStyle;
  final LinearGaugeStyle? backgroundStyle;
  final LinearNeedle? needle;
  final void Function(Canvas canvas, Offset position)? customDrawNeedle;
  const GxProgressLinearGauge(
      {super.key,
      required this.value,
      this.foregroundStyle,
      this.backgroundStyle,
      this.needle,
      this.customDrawNeedle})
      :
        // Both styles can not be null
        assert(foregroundStyle != null || backgroundStyle != null);

  @override
  Widget build(BuildContext context) {
    final LinearGaugeStyle style = backgroundStyle ??
        foregroundStyle ??
        LinearGaugeStyle(size: Size(MediaQuery.sizeOf(context).width, 10));
    return CustomPaint(
      size: style.size,
      painter: LinearGaugeProgressPainter(
          foregroundStyle: foregroundStyle ?? style,
          backgroundStyle: backgroundStyle ?? style,
          gaugeValue: value,
          needle: needle ?? const LinearNeedle(),
          customDrawNeedle: customDrawNeedle),
    );
  }
}
