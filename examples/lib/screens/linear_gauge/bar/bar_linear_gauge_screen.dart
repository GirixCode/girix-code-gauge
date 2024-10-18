import 'package:flutter/material.dart';
import 'package:girix_shape/girix_shape.dart';

class MyBarLinearGaugeScreen extends StatefulWidget {
  const MyBarLinearGaugeScreen({super.key});

  @override
  State<MyBarLinearGaugeScreen> createState() => _MyBarLinearGaugeScreenState();
}

class _MyBarLinearGaugeScreenState extends State<MyBarLinearGaugeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Linear Gauge $width'),
      ),
      body: ListView(
        children: [
          Text('Max Width Query: $width'),
          const Text('Max Width Maz Double: ${double.minPositive}'),
          buildCard(
              'Default Linear Bar Gauge',
              LinearBarGauge(
                size: Size(width, 40),
                value: const GaugeValue(
                  value: 60,
                ),
                barPointers: [
                  LinearBarPointer(value: 50, thickness: 5, color: Colors.teal),
                  LinearBarPointer(
                      color: Colors.lightBlue, value: 30, thickness: 5),
                  LinearBarPointer(
                      color: Colors.amber, value: 20, thickness: 5),
                ],
              )),
          buildCard(
              "With Gap Between Bars",
              LinearBarGauge(
                size: const Size(410, 40),
                value: const GaugeValue(
                  value: 60,
                  min: 0,
                  max: 200,
                ),
                gapBetweenBars: 2,
                barPointers: [
                  LinearBarPointer(
                      // strokeCap: StrokeCap.square,
                      // paintingStyle: PaintingStyle.stroke,
                      // radius: const Radius.circular(2),
                      value: 20,
                      thickness: 5,
                      color: Colors.green),
                  LinearBarPointer(
                      color: Colors.redAccent, value: 130, thickness: 5),
                  LinearBarPointer(
                      color: Colors.amber, value: 50, thickness: 5),
                ],
              )),

          const SizedBox(height: 10),
          // Customized Bar Gauge Style with Gap
          buildCard(
              "Customized Bar Gauge Style with Gap",
              LinearBarGauge(
                size: const Size(410, 40),
                value: const GaugeValue(
                  value: 130,
                  min: 0,
                  max: 200,
                ),
                gapBetweenBars: 10,
                barPointers: [
                  LinearBarPointer(
                      value: 20,
                      thickness: 5,
                      color: Colors.green,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(20)),
                  LinearBarPointer(
                      color: Colors.orange,
                      value: 130,
                      thickness: 5,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(2)),
                  LinearBarPointer(
                      color: Colors.brown,
                      value: 50,
                      thickness: 5,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.fill,
                      radius: const Radius.circular(2)),
                ],
              )),
          const SizedBox(height: 10),
          buildCard(
              "With a needle",
              LinearBarGauge(
                size: const Size(410, 25),
                value: const GaugeValue(
                  value: 70,
                  min: 0,
                  max: 100,
                ),
                gapBetweenBars: 5,
                needle: const LinearNeedle(
                    enabled: true,
                    color: Colors.black,
                    size: Size(2, 75),
                    position: LinearGaugeNeedlePosition.bottom,
                    needleType: LinearGaugeNeedleType.pipe),
                barPointers: [
                  LinearBarPointer(
                      // strokeCap: StrokeCap.square,
                      // paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(5),
                      value: 75,
                      thickness: 5,
                      color: Colors.blueGrey.shade300),
                  LinearBarPointer(
                      radius: const Radius.circular(5),
                      color: Colors.blueGrey,
                      value: 25,
                      thickness: 5),
                  // LinearBarPointer(
                  //     color: Colors.blueGrey.shade600, value: 50, thickness: 5),
                ],
              )),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildCard(
    String title,
    Widget child,
  ) {
    return Card(
      elevation: 0.1,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
