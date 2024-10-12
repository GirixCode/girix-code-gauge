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
class GaugeValue {
  final double value;
  final double min;
  final double max;

  GaugeValue({
    required this.value,
    this.min = 0.0,
    this.max = 100.0,
  });
}
