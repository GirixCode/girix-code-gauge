enum LinearGaugeAxisPosition { start, end, center }

enum LinearGaugeDirection { horizontal, vertical }

enum LinearGaugeLabelPosition {
  start,

  /// Label position at the start of the gauge
  end,

  /// Label position at the end of the gauge
  center

  /// Label position at the center of the gauge
}

enum LinearGaugeNeedlePosition {
  top,

  /// Needle position at the start of the gauge
  bottom,

  /// Needle position at the end of the gauge
  center

  /// Needle position at the center of the gauge
}

/// Enum for the type of needle to be used in the gauge
/// The needle can be a circle, triangle, diamond, rectangle, or a custom shape
enum LinearGaugeNeedleType {
  /// Custom needle type such as this ✒
  custom,

  /// Circle needle type such as this ●
  circle,

  /// Triangle needle type such as this ▲
  triangle,

  /// Diamond needle type such as this ◆
  diamond,

  /// Rectangle needle type such as this ■
  rectangle,

  /// Pipe needle type such as this |
  pipe
}

// Category: Linear Gauge
enum LinearGaugeShape {
  progress, // Standard linear gauge with a progress bar
  defaultGauge, // Standard linear gauge with ticks and labels
  segmentedColor, // Gauge with segments in different colors
  gradientColor, // Gauge with a smooth gradient
  pyramid, // Gauge with increasing/decreasing width in a pyramid shape
  triangleMarker, // Gauge with a triangle pointer/marker
  blockSegments, // Gauge divided into block-like segments
  bandedColor, // Gauge with distinct color bands along the bar
  barWithMarker, // Bar gauge with a pointer/marker
  horizontalStrip, // Gauge with horizontal strips in different shades
  thickSegmented, // Thick segmented gauge with color-coded sections
  arrowPointer, // Gauge with an arrow pointer
  flatMinimal, // Flat, minimal gauge with simple slider
}
