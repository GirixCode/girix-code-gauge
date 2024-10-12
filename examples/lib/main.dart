import 'package:flutter/material.dart';
import 'package:flutter_shapes_package/flutter_shapes_package.dart'; // Import your package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build your example app using the widgets from your package
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shapes Package Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shapes Package Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use the LinearGauge widget from your package
              LinearGauge(
                value: 50,
                min: 0,
                max: 100,
                color: Colors.blue,
                thickness: 10,
              ),
              const SizedBox(height: 50),
              // Use the RadialGauge widget from your package
              SizedBox(
                width: 200,
                height: 200,
                child: RadialGauge(
                  value: 75,
                  min: 0,
                  max: 100,
                  strokeWidth: 15,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
