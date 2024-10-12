// example/lib/main.dart

import 'dart:async';

import 'package:examples/screens/progress_linear_gauge.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  bool reRender = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Girix Shape Example',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Girix Shape Example'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  refreshPage();
                },
              )
            ],
          ),
          body: reRender
              ? ListView(
                  // physics: const ClampingScrollPhysics(),
                  // shrinkWrap: true,
                  children: const [
                    MyProgressLinearGauge(),
                  ],
                )
              : const Center(
                  child: Text('Click on the refresh icon to reload the page'),
                )),
    );
  }

  void refreshPage() {
    setState(() {
      reRender = !reRender;
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        reRender = !reRender;
      });
    });
  }
}
