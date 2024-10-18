import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/enums.dart';

/// Gauge value model
///
/// This model is used to represent the value of a gauge. It contains the value, the minimum value and the maximum value.
///
/// [value] double: The value of the gauge. It is required.
///
/// [min] double: The minimum value of the gauge. Default is 0.0.
///
/// [max] double: The maximum value of the gauge. Default is 100.0.
///
class GaugeValue extends Equatable {
  final double value;
  final double min;
  final double max;
  const GaugeValue({
    required this.value,
    this.min = 0.0,
    this.max = 100.0,
  })  : assert(min < max, 'min must be less than max'),
        assert(
            value >= min && value <= max, 'value must be between min and max');

  @override
  List<Object?> get props => <Object?>[value, min, max];
}

class LinearBarPointer {
  final double value;
  final Color color;
  final double thickness;
  final LinearElementPosition position;
  Shader Function(Rect)? shaderCallback;
  final Color? borderColor;
  final double borderWidth;
  final double offset;
  final Radius? radius;
  final PaintingStyle paintingStyle;
  final StrokeCap strokeCap;
  LinearBarPointer({
    required this.value,
    this.color = Colors.blue,
    this.thickness = 5.0,
    this.position = LinearElementPosition.cross,
    this.shaderCallback,
    this.borderColor,
    this.borderWidth = 5.0,
    this.radius,
    this.offset = 0.0,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
  });
}

// Directional Linear Gauge
