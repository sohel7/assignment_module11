import 'package:assignment_module11/photo_details_screen.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';

class PhotoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: ApiService().getPhotos() as Future<List<Photo>>?,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Photo photo = snapshot.data![index];
                  return ListTile(
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.primaries[index % Colors.primaries.length],
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(photo.title),
                        SizedBox(width: 10),
                        Image.network(
                          photo.url,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // You can customize this part to show a default image or placeholder.
                            return Image.asset(
                              'assets/default_image.png',
                              width: 50,
                              height: 50,
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailScreen(photo: photo),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
