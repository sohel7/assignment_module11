import 'package:flutter/material.dart';

import 'api_service.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  PhotoDetailScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(photo.url), // Display the full-size image
            Text(photo.title), // Display the title
            Text('ID: ${photo.id}'), // Display the ID
          ],
        ),
      ),
    );
  }
}


