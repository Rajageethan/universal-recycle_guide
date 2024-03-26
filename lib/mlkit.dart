import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:guide/background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dataset.dart';

class Mlkit extends StatefulWidget {
  const Mlkit({Key? key}) : super(key: key);

  @override
  State<Mlkit> createState() => _MlkitState();
}

class _MlkitState extends State<Mlkit> {
  bool imageLabelChecking = false;
  XFile? imageFile;
  String imageLabel = "";
  List<String> imageLabelList = [];
  String imagePath = "";
  bool isLoading = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          const Background(),
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imageLabelChecking) const CircularProgressIndicator(),
                if (!imageLabelChecking && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                if (imageFile != null)
                  Image.file(
                    File(imageFile!.path),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey[400],
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.red,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey[400],
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.red,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Show loading indicator
                    setState(() {
                      isLoading = true;
                    });

                    // Fetch location in the background
                    Position? position = await _getCurrentLocation();

                    // Hide loading indicator
                    setState(() {
                      isLoading = false;
                    });

                    if (position != null) {
                      // Search for recycling centers near the user's location
                      _searchRecycleCenters(
                          position.latitude, position.longitude);
                    } else {
                      // Handle case where location couldn't be obtained
                      print('Error: Unable to fetch location.');
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Find Nearby Recycle Centers'),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (imageLabelList.isNotEmpty)
                  Text(
                    (imageLabelList[0]),
                    style: const TextStyle(fontSize: 18.0),
                  )
                else
                  const Text(
                    "No labels available",
                    style: TextStyle(fontSize: 18.0),
                  ),
                if (imageLabelList.isNotEmpty)
                  MaterialClassificationContainer(imageLabelList[0]),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        ]
      ),
      
    );
  }

  Future<Position?> _getCurrentLocation() async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle case where user denies location permission
        print('Error: Location permission denied.');
        return null;
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      // Handle errors (e.g., no GPS, no network, etc.)
      print('Error: $e');
      return null;
    }
  }

  void _searchRecycleCenters(double latitude, double longitude) async {
    // Launch Google Maps with a query to search for recycling centers
    String mapsUrl =
        'https://www.google.com/maps/search/recycling+centers/@$latitude,$longitude,15z';
    if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    } else {
      // Handle case where maps application cannot be launched
      print('Error: Unable to open maps application.');
    }
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        imageLabelChecking = true;
        imageFile = pickedImage;
        setState(() {});
        getImageLabels(pickedImage);
      }
    } catch (e) {
      imageLabelChecking = false;
      imageFile = null;
      imageLabel = "Error occurred while getting image Label";
      setState(() {});
    }
  }

  void getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    print(inputImage);
    List<String> labelList = [];
    ImageLabeler imageLabeler =
        ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.75));
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    StringBuffer sb = StringBuffer();
    for (ImageLabel imgLabel in labels) {
      String lblText = imgLabel.label;
      sb.write(lblText);
      labelList.add(lblText);
    }
    print(imageLabelList);
    imageLabelList = labelList;
    imageLabeler.close();
    imageLabel = sb.toString();
    imageLabelChecking = false;
    setState(() {});
  }
}
