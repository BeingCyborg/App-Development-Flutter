import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetRearrangeApp());
}

class WidgetRearrangeApp extends StatelessWidget {
  const WidgetRearrangeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const PortraitLayout();
            } else {
              return const LandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/big_image.jpg"),
            radius: 120,
          ),
          const SizedBox(height: 16),
          const Text(
            'Mary Jones',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Mary Jones is an Administrative Assistant with eight years of experience.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0, // Increase the horizontal spacing here
              mainAxisSpacing: 16.0, // Increase the vertical spacing here
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset('assets/small_image.jpg'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Wrap with Container and set a fixed height
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/big_image.jpg'),
                radius: 100,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mary Jones',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Mary Jones is an Administrative Assistant with eight years of experience.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing:
                          16.0, // Increase the horizontal spacing here
                      mainAxisSpacing:
                          16.0, // Increase the vertical spacing here
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Image.asset('assets/small_image.jpg'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
