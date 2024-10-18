import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';

class ExponentialScaleLinearGaugeBody extends StatefulWidget {
  const ExponentialScaleLinearGaugeBody({super.key});

  @override
  State<ExponentialScaleLinearGaugeBody> createState() =>
      _ExponentialScaleLinearGaugeBodyState();
}

class _ExponentialScaleLinearGaugeBodyState
    extends State<ExponentialScaleLinearGaugeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      key: const Key('exponential_scale_linear_gauge_list'),
      children: [
        ...[
          buildCard(
            'Default Scale Linear Gauge',
            const ScaleLinearGauge(
              height: 80,
              gaugeType: ScaleLinearGaugeType.exponential,
            ),
          ),
          buildCard(
            'With basic Customized Style',
            const ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
              minimum: 0,
              maximum: 100,
              interval: 20,
              minorTicksPerInterval: 5,
              axisSpaceExtent: 2,
              majorTickStyle: LinearTickStyle(
                length: 20,
                thickness: 2,
                color: Colors.blue,
              ),
            ),
          ),
          buildCard(
              'With Customized Label and Axis',
              ScaleLinearGauge(
                gaugeType: ScaleLinearGaugeType.exponential,
                height: 80,
                minimum: 0,
                maximum: 100,
                interval: 50,
                minorTicksPerInterval: 10,
                axisSpaceExtent: 2,
                axisLabelStyle: const TextStyle(
                  color: Colors.teal,
                  fontSize: 10,
                ),
                valueToLabelFormatCallback: (value, index) => 'Label-$value',
                labelPosition: LinearGaugeLabelPosition.topCenter,
                majorTickStyle: const LinearTickStyle(
                  length: 40,
                  thickness: 2,
                  color: Colors.teal,
                ),
                axisTrackStyle: const LinearAxisTrackStyle(
                  color: Colors.teal,
                ),
                minorTickStyle:
                    const LinearTickStyle(color: Colors.white, thickness: 2),
              )),
          buildCard(
            'With Tick outside',
            ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
              minimum: 0,
              maximum: 100,
              interval: 20,
              minorTicksPerInterval: 5,
              axisSpaceExtent: 2,
              labelPosition: LinearGaugeLabelPosition.bottomCenter,
              tickPosition: LinearElementPosition.outside,
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 2,
              ),
              majorTickStyle: const LinearTickStyle(
                length: 50,
                thickness: 2,
              ),
              minorTickStyle: const LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              markerPointers: [
                LinearMarkerPointer(
                  value: 50,
                  marker: const Icon(Icons.circle, color: Colors.red, size: 10),
                ),
              ],
            ),
          ),
          buildCard(
            'With Tick inside',
            const ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
              tickPosition: LinearElementPosition.inside,
              minorTickStyle: LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              majorTickStyle: LinearTickStyle(
                length: 60,
                thickness: 1,
              ),
              axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 10,
                  strokeCap: StrokeCap.round,
                  color: Colors.orange),
              // showAxisLabel: false,
              // showAxisTrack: false,
            ),
          ),
          buildCard(
            'With Tick Out and In',
            const ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
              tickPosition: LinearElementPosition.outAndIn,
              minorTickStyle: LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              majorTickStyle: LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 2,
                  strokeCap: StrokeCap.round,
                  color: Colors.orange),
              // showAxisLabel: false,
              // showAxisTrack: false,
              showMinorTicks: false,
            ),
          ),
          buildCard(
            'With Tick In and Out',
            const ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
              tickPosition: LinearElementPosition.inAndOut,
              minorTickStyle: LinearTickStyle(
                length: 10,
                thickness: 1,
              ),
              majorTickStyle: LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 2,
                  strokeCap: StrokeCap.round,
                  color: Colors.orange),
              // showAxisLabel: false,
              // showAxisTrack: false,
              showMinorTicks: true,
            ),
          ),
          buildCard(
            'With Customized Major Tick Style',
            ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 100,
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
                  thickness: 4,
                  strokeCap: StrokeCap.round,
                  color: Colors.black),
              showMinorTicks: false,
              valueToMajorTickStyleCallback: (value, index) {
                return LinearTickStyle(
                  length: 60,
                  thickness: value == 50 ? 16 : 4,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
            ),
          ),
          buildCard(
            'With Customized Linear Needle',
            ScaleLinearGauge(
              gaugeType: ScaleLinearGaugeType.exponential,
              height: 80,
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
              value: const GaugeValue(
                value: 80,
              ),
              needle: const LinearNeedle(
                  enabled: true,
                  color: Colors.deepOrange,
                  size: Size(20, 20),
                  position: LinearGaugeNeedlePosition.bottom,
                  needleType: LinearGaugeNeedleType.triangle,
                  offset: 10),
            ),
          ),
          buildCard(
            'With Marker Pointers',
            ScaleLinearGauge(
                gaugeType: ScaleLinearGaugeType.exponential,
                height: 100,
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
                    // marker:
                    //     const Icon(Icons.circle, color: Colors.red, size: 10),
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
                ]),
          ),
          const SizedBox(
            height: 100,
          )
        ].map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), child: e)),
      ],
    );
  }

  // Build a Card with a ScaleLinearGauge
  Widget buildCard(
    String title,
    Widget child,
  ) {
    return Card(
      elevation: 0.1,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}