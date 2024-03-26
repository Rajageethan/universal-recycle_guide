import 'package:flutter/material.dart';

class DescriptionDialog extends StatelessWidget {
  const DescriptionDialog({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How to Use the Application'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            const Text(
                'Capture or select a photo from your camera or gallery. Once the image is recognized, the object will be classified into the following categories:'),
            buildBulletText('Organic Waste'),
            buildBulletText('Inorganic Waste'),
            buildBulletText('Hazardous Waste'),
            buildBulletText('Paper'),
            buildBulletText('Glass'),
            buildBulletText('Metal'),
            buildBulletText('E-waste'),
            const SizedBox(height: 5.0),
            const Text(
                'Unlock information and helpful tips for each category to recycle, dispose or reuse. '),
            const SizedBox(height: 5.0),
            const Text('Please note: This application is still under development, and some features may have limitations.')
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget buildBulletText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•', style: TextStyle(fontSize: 20)), // Bullet point
          const SizedBox(width: 8.0),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
