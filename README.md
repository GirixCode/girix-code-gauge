# Girix Code Gauge

![alt](./examples//assets/images/banner/2.png)

A Flutter package for creating customizable progress linear, linear gauges, radial gauges, and more. **girix_code_gauge** provides a collection of widgets to easily integrate dynamic and visually appealing gauges and shapes into the applications.

---

## **Table of Contents**

- [Girix Code Gauge](#girix-code-gauge)
  - [**Table of Contents**](#table-of-contents)
  - [**Features**](#features)
  - [**Preview**](#preview)
  - [**Installation**](#installation)
  - [**Getting Started**](#getting-started)
    - [**Importing the Package**](#importing-the-package)
    - [**Usage Examples**](#usage-examples)
      - [**Progress Linear Gauge**](#progress-linear-gauge)
        - [**Properties**](#properties)
        - [**1. Default**](#1-default)
        - [**2. Add Needle and It's customization**](#2-add-needle-and-its-customization)
          - [**Example**](#example)
        - [**3. Add Label**](#3-add-label)
          - [**Example**](#example-1)
        - [**4. Animated Progress Linear Gauge**](#4-animated-progress-linear-gauge)
      - [**Scale Linear Gauge**](#scale-linear-gauge)
        - [**Properties of ScaleLinearGauge**](#properties-of-scalelineargauge)
        - [**1. Default Scale Linear Gauge**](#1-default-scale-linear-gauge)
        - [**2. With basic Customized Style**](#2-with-basic-customized-style)
        - [**3. Axis Tick Position**](#3-axis-tick-position)
          - [**Example**](#example-2)
        - [**4. Customized Axis and Major Tick Style**](#4-customized-axis-and-major-tick-style)
          - [**Example**](#example-3)
        - [**5. Customized Scale Linear Needle**](#5-customized-scale-linear-needle)
          - [**Example**](#example-4)
        - [**6. Fill Area and Marker Pointers**](#6-fill-area-and-marker-pointers)
          - [**Example**](#example-5)
        - [**7. Multi Range Scale Linear Gauge**](#7-multi-range-scale-linear-gauge)
          - [**Example**](#example-6)
        - [**8. Multi Range: Color on Axis Tick**](#8-multi-range-color-on-axis-tick)
          - [**Example**](#example-7)
        - [**9. Multi Range: Color on Axis Tick for In and Out**](#9-multi-range-color-on-axis-tick-for-in-and-out)
  - [**Customization**](#customization)
  - [**License**](#license)
  - [**Additional Resources**](#additional-resources)

---

## **Features**

- Draw basic gauges like progress, scale, bar linear gauges using customizable widgets.
- Create linear gauges with various styles and animations.
- Implement radial gauges with flexible customization options.
- Support for different needle types and positions.
- Customizable ranges and scales for gauges.
- Animated transitions for gauge values.
- Easy integration and usage with simple APIs.

---

## **Preview**

![alt](./examples//assets/images/features/linear/linear-preview.png)

---

## **Installation**

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  girix_code_gauge: ^0.0.1
```

Then run:

```dart
flutter pub get
```

---

## **Getting Started**

### **Importing the Package**

Import `girix_code_gauge` in your Dart code:

```dart
import 'package:girix_code_gauge/gauges.dart';
```

### **Usage Examples**

#### **Progress Linear Gauge**

he `GxProgressLinearGauge` widget is used to display a progress linear gauge.

##### **Properties**

- `value`: An instance of the `GaugeValue` class that holds the value of the gauge.
  - `value`: The value of the progress linear gauge.
  - `min`: The minimum value of the progress linear gauge.
  - `max`: The maximum value of the progress linear gauge.
- `style`: An instance of the `ProgressLinearStyle` class that holds the style properties of the progress linear gauge.

  - `color`: The color of the active part of the progress linear gauge.
  - `backgroundColor`: The color of the background part of the progress linear gauge.
  - `dense`: Whether the progress linear gauge is dense.
  - `thickness`: The thickness of the progress linear gauge.
  - `radius`: The radius of the progress linear gauge.
  - `strokeCap`: The stroke cap of the progress linear gauge.
  - `paintingStyle`: The painting style of the progress linear gauge.

- `label`: An instance of the `GaugeLabel` class that holds the label properties of the progress linear gauge.

  - `label`: The label of the progress linear gauge.
  - `style`: The style of the label.
  - `textAlign`: The alignment of the label.
  - `spaceExtent`: The space extent of the label.
  - `offset`: The offset of the label.

- `needle`: An instance of the `LinearNeedle` class that holds the needle properties of the progress linear gauge.

  - `enabled`: Whether the needle is enabled.
  - `position`: The position of the needle.
  - `size`: The size of the needle.
  - `color`: The color of the needle.
  - `needleType`: The type of the needle and more.

- `customDrawNeedle`: A function that allows you to draw a custom needle on the progress linear gauge.
- `reverse`: Whether the progress linear gauge is reversed.
- `showLabel`: Whether the label is shown.
- `height`: The height of the progress linear gauge.

##### **1. Default**

Add a simple progress linear gauge widget as a child of any widget.

```dart
SizedBox(
    height: 80
    child: GxProgressLinearGauge(
        value: GaugeValue(value: 50),
    )
)
```

##### **2. Add Needle and It's customization**

Add a linear needle to the progress linear gauge widget by passing the `needle` property. You can customize the needle by changing the `position`, `size`, `color`, and `needleType`.
You can add a style to the gauge by passing the `style` property.

<img src="./examples//assets/images/features/linear/progress-needle-center.png" alt="Add Needle and It's customization" width="100%"/>

###### **Example**

```dart
SizedBox(
    height: 80,
    child: GxProgressLinearGauge(
        value: const GaugeValue(value: 80, min: 0, max: 100),
        style: const ProgressLinearStyle(
            color: Colors.orange,
        ),
        needle: LinearNeedle(
            position: LinearGaugeNeedlePosition.center,
            size: const Size(20, 20),
            color: Colors.blueGrey,
            needleType: LinearGaugeNeedleType.diamond
        )
    )
)
```

##### **3. Add Label**

Add a label to the progress linear gauge widget by passing the `label` property. You can customize the label by changing the `label`, `style`, `textAlign`, and `spaceExtent`. You can show the label by passing the `showLabel` property. The `{value}` in the label will be replaced by the actual value of the gauge.

<img src="./examples//assets/images/features/linear/progress-label.png" alt="Label" width="100%"/>

###### **Example**

```dart
SizedBox(
    height: 100,
    child: GxProgressLinearGauge(
        label: GaugeLabel(
            label: '{value} %',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            spaceExtent: 4),
        showLabel: true,
        height: 30,
        value: GaugeValue(value: 39, min: 00, max: 100),
        style: ProgressLinearStyle(
            color: Colors.orange, dense: false, thickness: 6),
    ),
)
```

##### **4. Animated Progress Linear Gauge**

Add an animated progress linear gauge widget by passing the `animationType` property of `GxAnimatedProgressLinearGauge` widget. You can customize the animation by changing the `animationType`.
This widget is in **development**. It can be used to show the progress of a task.

```dart
SizedBox(
    height: 80,
    child: GxAnimatedProgressLinearGauge(
        value: 60,
        style: ProgressLinearStyle(
            color: Colors.deepOrange.shade100, thickness: 10),
        animationType: GaugeAnimationType.linear,
        needle: const LinearNeedle(
            position: LinearGaugeNeedlePosition.bottom,
            size: Size(20, 20),
            color: Colors.deepOrange,
            needleType: LinearGaugeNeedleType.triangle),
    )
)
```

#### **Scale Linear Gauge**

The Scale Linear Gauge is used to display a linear gauge with scale with different customization options.

##### **Properties of ScaleLinearGauge**

- `minimum` - The minimum value of the gauge. Default is `0`.
- `maximum` - The maximum value of the gauge. Default is `100`.
- `interval` - The interval value of the gauge. Default is `10`.
- `minorTicksPerInterval` - The number of minor ticks per interval. Default is `1`.
- `axisSpaceExtent` - The space extent of the axis. Default is `0`.
- `labelPosition` - The position of the label. Default is `LinearGaugeLabelPosition.bottomCenter`.
- `tickPosition` - The position of the tick. Default is `LinearElementPosition.inside`.
- `axisTrackStyle` - The style of the axis track. Default is `LinearAxisTrackStyle()`.
- `majorTickStyle` - The style of the major tick. Default is `LinearTickStyle()`.
- `minorTickStyle` - The style of the minor tick. Default is `LinearTickStyle()`.
- `markerPointers` - The list of marker pointers. Default is `null`.
- `barPointers` - The list of bar pointers. Default is `null`.
- `barHeight` - The height of the bar. Default is `10`.
- `barOffset` - The offset of the bar. Default is `0`.
- `needle` - The needle of the gauge. Default is `null`.
- `valueToLabelFormatCallback` - The callback to format the label. Default is `null`.
- `valueToMajorTickStyleCallback` - The callback to format the major tick style. Default is `null`.
- `valueToLabelStyleCallback` - The callback to format the label style. Default is `null`.
- `fillAreaPointers` - The list of fill area pointers. Default is `null`.
- `showAxisLabel` - Whether to show the axis label. Default is `true`.
- `showAxisTrack` - Whether to show the axis track. Default is `true`.
- `showMinorTicks` - Whether to show the minor ticks. Default is `true`.

##### **1. Default Scale Linear Gauge**

Create a default scale linear gauge widget and add it to your widget.

```dart
GxScaleLinearGauge()
```

##### **2. With basic Customized Style**

Create a scale linear gauge widget with basic customized style with minimum, maximum, interval, minorTicksPerInterval, axisSpaceExtent, majorTickStyle.

```dart
GxScaleLinearGauge(
  minimum: 0,
  maximum: 100,
  interval: 20,
  minorTicksPerInterval: 5,
  axisSpaceExtent: 2,
  majorTickStyle: LinearTickStyle(
    length: 20,
    thickness: 2,
    color: Colors.blue,
  )
)
```

##### **3. Axis Tick Position**

Create a scale linear gauge widget with tick position such as `inside`, `outside`, `outAndIn`, `inAndOut`.

<!-- ![alt](./examples//assets/images/features/linear/scale-inside.png) -->

<img src="./examples//assets/images/features/linear/scale-inside.png" alt="Axis Tick Position" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    tickPosition: LinearElementPosition.inside,
    minorTickStyle: LinearTickStyle(
        length: 20,
        thickness: 1,
    ),
    majorTickStyle: LinearTickStyle(
        length: 40,
        thickness: 1,
    ),
    axisTrackStyle: LinearAxisTrackStyle(
        thickness: 2, strokeCap: StrokeCap.butt, color: Colors.orange
    )
 )
```

##### **4. Customized Axis and Major Tick Style**

Create a scale linear gauge widget with customized axis and major tick style with `axisLabelStyle`, `valueToLabelFormatCallback`, `labelPosition`, `majorTickStyle`, `axisTrackStyle`, `minorTickStyle` properties.

<!-- ![alt](./examples//assets/images/features/linear/scale-custom-axis-major-style.png) -->

<img src="./examples//assets/images/features/linear/scale-custom-axis-major-style.png" alt="Customized Axis and Major Tick Style" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    tickPosition: LinearElementPosition.inAndOut,
    minorTickStyle: const LinearTickStyle(
        length: 10,
        thickness: 1,
    ),
    majorTickStyle: const LinearTickStyle(
        length: 60,
        thickness: 4,
    ),
    axisTrackStyle: const LinearAxisTrackStyle(
        thickness: 4, strokeCap: StrokeCap.round, color: Colors.black),
    showMinorTicks: false,
    valueToMajorTickStyleCallback: (value, index) {
        return LinearTickStyle(
        length: 60,
        thickness: value == 50 ? 16 : 4,
        color: Colors.primaries[index % Colors.primaries.length],
        );
    },
)
```

##### **5. Customized Scale Linear Needle**

Create a scale linear gauge widget with customized linear needle with `needle`, `offset`, `enabled`, `color`, `size`, `position`, `needleType` properties.

<!-- ![alt](./examples//assets/images/features/linear/scale-needle-position.png) -->

<img src="./examples//assets/images/features/linear/scale-needle-position.png" alt="Customized Scale Linear Needle" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    minimum: 0,
    maximum: 100,
    interval: 10,
    minorTicksPerInterval: 2,
    axisLabelStyle: const TextStyle(
        color: Colors.deepOrange,
        fontSize: 14,
    ),
    valueToLabelFormatCallback: (value, index) => value,
    labelPosition: LinearGaugeLabelPosition.topCenter,
    majorTickStyle: const LinearTickStyle(
        length: 40,
        thickness: 2,
        color: Colors.deepOrange,
    ),
    axisTrackStyle: const LinearAxisTrackStyle(
        color: Colors.deepOrange,
    ),
    minorTickStyle: const LinearTickStyle(
        color: Colors.deepOrange, thickness: 2, length: 18),
    value: 80,
    needle: const LinearNeedle(
        offset: 20,
        enabled: true,
        color: Colors.deepOrange,
        size: Size(20, 20),
        position: LinearGaugeNeedlePosition.bottom,
        needleType: LinearGaugeNeedleType.triangle,
    )
)
```

##### **6. Fill Area and Marker Pointers**

Create a scale linear gauge widget with fill area and marker pointers with `fillAreaPointers`, `markerPointers` properties.

<!-- ![alt](./examples//assets/images/features/linear/scale-filled-area.png) -->

<img src="./examples//assets/images/features/linear/scale-filled-area.png" alt="Fill Area and Marker Pointers" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    tickPosition: LinearElementPosition.outAndIn,
    minorTickStyle: const LinearTickStyle(
        length: 10,
        thickness: 1,
    ),
    majorTickStyle: const LinearTickStyle(
        length: 60,
        thickness: 1,
    ),
    axisTrackStyle: const LinearAxisTrackStyle(
        thickness: 2,
        strokeCap: StrokeCap.round,
        color: Colors.black26),
    showMinorTicks: false,
    valueToMajorTickStyleCallback: (value, index) {
        return LinearTickStyle(
        length: 60,
        thickness: (value == 30 || value == 80) ? 4 : 1,
        color: (value == 30 || value == 80)
            ? Colors.green
            : Colors.black26,
        );
    },
    valueToLabelFormatCallback: (value, index) =>
        value.length == 1 ? '0$value' : value,
    markerPointers: [
        LinearMarkerPointer(
            value: 10,
            needle: const LinearNeedle(
                enabled: true,
                color: Colors.blueGrey,
                size: Size(2, 70),
                position: LinearGaugeNeedlePosition.center,
                needleType: LinearGaugeNeedleType.pipe,
                offset: 10,
            ),
        ),
        LinearMarkerPointer(
            value: 70,
            needle: const LinearNeedle(
                enabled: true,
                color: Colors.blueGrey,
                size: Size(2, 70),
                position: LinearGaugeNeedlePosition.center,
                needleType: LinearGaugeNeedleType.pipe,
                offset: 10,
            ),
        ),
    ],
    valueToLabelStyleCallback: (value, index) => TextStyle(
        color:
            (value == 10 || value == 70) ? Colors.black : Colors.black38,
        fontWeight: (value == 10 || value == 70)
            ? FontWeight.bold
            : FontWeight.normal,
    ),
    fillAreaPointers: [
        FillAreaPointer(
            thickness: 60,
            startValue: 30,
            endValue: 80,
            color: Colors.green.withOpacity(0.3))
        ],
    )
```

##### **7. Multi Range Scale Linear Gauge**

Create a range scale linear gauge with multiple ranges.

<!-- ![alt](./examples//assets/images/features/linear/scale-multi-range.png) -->

<img src="./examples//assets/images/features/linear/scale-multi-range.png" alt="Multi Range Scale Linear Gauge" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    minimum: 0,
    maximum: 100,
    interval: 20,
    minorTicksPerInterval: 5,
    axisSpaceExtent: 2,
    labelPosition: LinearGaugeLabelPosition.topCenter,
    tickPosition: LinearElementPosition.outside,
    axisTrackStyle: const LinearAxisTrackStyle(
        thickness: 3,
    ),
    majorTickStyle: const LinearTickStyle(
        length: 50,
        thickness: 2,
    ),
    minorTickStyle: const LinearTickStyle(
        length: 30,
        thickness: 1,
    ),
    barOffset: 1,
    barHeight: 35,
    barPointers: [
    LinearBarPointer(
        label: const GaugeLabel(label: 'Low'),
        value: barValue,
        thickness: 5,
        color: Colors.brown),
    LinearBarPointer(
        label: const GaugeLabel(label: 'Medium'),
        color: Colors.yellow.shade700,
        value: barValue,
        thickness: 5),
    LinearBarPointer(
        label: const GaugeLabel(label: 'High'),
        color: Colors.cyan.shade700,
        value: barValue,
        thickness: 5),
    ]
)
```

##### **8. Multi Range: Color on Axis Tick**

Create a range scale linear gauge with multiple ranges and apply bar color on axis tick using `applyBarColorOnAxisTick` property.

<!-- ![alt](./examples//assets/images/features/linear/scale-multi-range-apply-color.png) -->
<img src="./examples//assets/images/features/linear/scale-multi-range-apply-color.png" alt="Multi Range: Color on Axis Tick" width="100%"/>

###### **Example**

```dart
GxScaleLinearGauge(
    tickPosition: LinearElementPosition.inside,
    labelPosition: LinearGaugeLabelPosition.bottomCenter,
    minorTickStyle: const LinearTickStyle(
        length: 20,
        thickness: 1,
    ),
    majorTickStyle: const LinearTickStyle(
        length: 40,
        thickness: 1,
    ),
    barHeight: 10,
    barOffset: 80,
    applyBarColorOnAxisTick: true,
    barPointers: [
    LinearBarPointer(
        value: barValue, thickness: 5, color: Colors.red.shade400),
    LinearBarPointer(
        color: Colors.tealAccent.shade700,
        value: barValue,
        thickness: 5),
    LinearBarPointer(
        color: Colors.orangeAccent.shade400,
        value: barValue,
        thickness: 5),
    ]
),
```

##### **9. Multi Range: Color on Axis Tick for In and Out**

Create a range scale linear gauge with multiple ranges and apply bar color on axis tick for in and out.

<!-- ![500](./examples//assets/images/features/linear/scale-multi-range-apply-color-no-axis.png) -->
<img src="./examples//assets/images/features/linear/scale-multi-range-apply-color-no-axis.png" alt="Multi Range: Color on Axis Tick for In and Out" width="100%"/>

```dart
GxScaleLinearGauge(
    tickPosition: LinearElementPosition.inAndOut,
    minorTickStyle: const LinearTickStyle(
        length: 10,
        thickness: 1,
    ),
    majorTickStyle: const LinearTickStyle(
        length: 40,
        thickness: 2,
    ),
    applyBarColorOnAxisTick: true,
    barPointers: [
        LinearBarPointer(
            value: barValue, thickness: 5, color: Colors.red.shade400),
        LinearBarPointer(
            color: Colors.tealAccent.shade700,
            value: barValue,
            thickness: 5),
        LinearBarPointer(
            color: Colors.orangeAccent.shade400,
            value: barValue,
            thickness: 5),
        ]
    )
```

## **Customization**

**girix_code_gauge** offers extensive customization options:

- **Needle Types**: Choose from `circle`, `triangle`, `diamond`, `rectangle`, or provide a custom needle.
- **Gauge Styles**: Customize colors, sizes, thicknesses, and more.
- **Animations**: Use built-in animations or define custom animation curves.
- **Scales and Ranges**: Define custom scales, intervals, and ranges for your gauges.
- **Orientation**: Use gauges in both horizontal and vertical orientations.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/yourusername/girix_code_gauge/blob/main/LICENSE) file for details.

---

## **Additional Resources**

- **Documentation**: API Reference
- **Example Project**: Check out the [example app](./examples/) for a full implementation.
- **Issue Tracker**: Have a bug or a feature request? Please open an [issue](https://github.com/mjfoxena/girix-code-gauge/issues).

---

**Thank you for using girix_code_gauge!** If you find this package useful, please ⭐ star the repository.

---

_For questions or suggestions, feel free to reach out at <mrutyunjaya@girixcode.com>._
