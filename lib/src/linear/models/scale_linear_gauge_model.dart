import 'package:flutter/material.dart';

class LinearAxisTrackStyle {
  final double thickness;
  final Color color;
  final StrokeCap strokeCap;
  final PaintingStyle paintingStyle;
  const LinearAxisTrackStyle({
    this.thickness = 5.0,
    this.color = Colors.grey,
    this.strokeCap = StrokeCap.butt,
    this.paintingStyle = PaintingStyle.stroke,
  });
}

class LinearBarPointer {
  final double value;
  final Color color;
  final double thickness;
  LinearBarPointer({
    required this.value,
    required this.color,
    required this.thickness,
  });
}

class LinearGaugeRange {
  final double startValue;
  final double endValue;
  final Color color;
  final String? label;
  LinearGaugeRange({
    required this.startValue,
    required this.endValue,
    required this.color,
    this.label,
  });
}

class LinearMarkerPointer {
  final double value;
  final Widget marker;
  LinearMarkerPointer({
    required this.value,
    required this.marker,
  });
}

/// The [LinearTickStyle] class holds the style properties of the ticks in the linear gauge.
///
/// The [LinearTickStyle] class requires the following properties:
///
/// - [length]: A double value that holds the length of the tick.
///
/// - [thickness]: A double value that holds the thickness of the tick.
///
/// - [color]: A Color value that holds the color of the tick.
///
/// Example:
///
/// ```dart
/// LinearTickStyle(
///  length: 8.0,
///  thickness: 1.0,
///  color: Colors.black,
/// )
/// ```
///
class LinearTickStyle {
  /// Specifies the length (size) of the tick in the linear gauge.
  ///
  /// The default value is 8.0.
  ///

  final double length;

  /// Specifies the thickness of the tick in the linear gauge.
  ///
  /// The default value is 1.0.
  ///
  final double thickness;

  /// Specifies the color of the tick in the linear gauge.
  ///
  /// The default value is Colors.black.
  ///

  final Color color;

  const LinearTickStyle({
    this.length = 8.0,
    this.thickness = 1.0,
    this.color = Colors.black,
  });
}
