import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide/dataset.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ImagePickerHandler extends StatefulWidget {
  final String imagePath;

  const ImagePickerHandler({required this.imagePath, Key? key}) : super(key: key);

  @override
  _ImagePickerHandlerState createState() => _ImagePickerHandlerState();
}

class _ImagePickerHandlerState extends State<ImagePickerHandler> {
  List<String> v = [];
  List<String> labels = [];

  @override
  void initState() {
    super.initState();
    loadModel();
    detectImage(widget.imagePath);
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );

    // Load labels from the file
    final labelsData = await rootBundle.loadString("assets/labels.txt");
    labels = LineSplitter.split(labelsData).toList();
  }

  Future<void> detectImage(String imagePath) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      String label = labels[recognitions[0]['index']];
      print("Image Label: $label");
      setState(() {
        v = label.split(' '); // Convert label to a list of characters
      });
    } else {
      print("No label detected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TFlite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            if (v.isNotEmpty) Text('Label as List: $v'),
            if (v.isNotEmpty) MaterialClassificationContainer(v[1]),
          ],
        ),
      ),
    );
  }
}

class ImagePickerDemo extends StatelessWidget {
  final String imagePath;

  const ImagePickerDemo({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePickerHandler(imagePath: imagePath);
  }
}
