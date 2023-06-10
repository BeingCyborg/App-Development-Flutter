import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: const Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Search Photos',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                buildPhotoButton(
                    context, 'Photo 1', 'https://picsum.photos/200'),
                buildPhotoButton(
                    context, 'Photo 2', 'https://picsum.photos/600'),
                buildPhotoButton(
                    context, 'Photo 3', 'https://picsum.photos/400'),
                buildPhotoButton(
                    context, 'Photo 4', 'https://picsum.photos/500'),
                buildPhotoButton(
                    context, 'Photo 5', 'https://picsum.photos/900'),
                buildPhotoButton(
                    context, 'Photo 6', 'https://picsum.photos/300'),
              ],
            ),
            ListView(
              shrinkWrap: true,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 1'),
                  subtitle: Text('Category 1'),
                ),
                const ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 2'),
                  subtitle: Text('Category 2'),
                ),
                const ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 3'),
                  subtitle: Text('Category 3'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Photos Uploaded Successfully!')),
          );
        },
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }

  Widget buildPhotoButton(
      BuildContext context, String caption, String imageUrl) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Clicked on photo!')),
        );
      },
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(caption),
        ],
      ),
    );
  }
}
