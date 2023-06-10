import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const PageWidget(0, Colors.blue),
    const PageWidget(1, Colors.green),
    const PageWidget(2, Colors.orange),
  ];

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayed Hossain Jobayer'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Homepage'),
              onTap: () {
                _selectPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Second page'),
              onTap: () {
                _selectPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Third page'),
              onTap: () {
                _selectPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Second page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Third page',
          ),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final int pageNumber;
  final Color color;

  const PageWidget(this.pageNumber, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $pageNumber',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
