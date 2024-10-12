import 'package:equatable/equatable.dart';

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
