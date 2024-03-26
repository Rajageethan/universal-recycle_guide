import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class RecycleCenterScreen extends StatefulWidget {
  const RecycleCenterScreen({Key? key}) : super(key: key);

  @override
  _RecycleCenterScreenState createState() => _RecycleCenterScreenState();
}

class _RecycleCenterScreenState extends State<RecycleCenterScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Center'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
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
                _searchRecycleCenters(position.latitude, position.longitude);
              } else {
                // Handle case where location couldn't be obtained
                print('Error: Unable to fetch location.');
              }
            },
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text('Find Nearby Recycle Centers'),
          ),
        ),
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
}
