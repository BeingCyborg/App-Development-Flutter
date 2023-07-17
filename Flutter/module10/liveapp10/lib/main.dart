import 'package:flutter/material.dart';

void main() {
  runApp(NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  const NewsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Center(
                  child: NewsFeedList(),
                )
              : NewsFeedGrid();
        },
      ),
    );
  }
}

class NewsFeedList extends StatelessWidget {
  final List<String> imageNames = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
    'image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageNames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Image.asset('assets/images/${imageNames[index]}'),
          ),
        );
      },
    );
  }
}

class NewsFeedGrid extends StatelessWidget {
  final List<String> imageNames = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
    'image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: imageNames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/${imageNames[index]}'),
        );
      },
    );
  }
}
