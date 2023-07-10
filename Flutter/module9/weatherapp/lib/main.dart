import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: WeatherApp()));
}

class WeatherData {
  String location;
  double temperature;
  String description;
  String iconUrl;
  double tempMax;
  double tempMin;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.description,
    required this.iconUrl,
    required this.tempMax,
    required this.tempMin,
  });
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String _location = '';
  double _temperature = 0;
  String _description = '';
  String _iconUrl = '';
  double _tempMax = 0;
  double _tempMin = 0;
  bool _isLoading = false;
  bool _hasError = false;
  bool _isLocationSelected = false;

  Future<void> _fetchWeatherData(String location) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _isLocationSelected = false;
    });

    try {
      String apiKey = '49d5072d84ee54b1442e663e13c20d1f';
      String apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';

      http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _location = data['name'];
          _temperature = data['main']['temp'];
          _description = data['weather'][0]['description'];
          _iconUrl =
              'http://openweathermap.org/img/w/${data['weather'][0]['icon']}.png';
          _tempMax = data['main']['temp_max'];
          _tempMin = data['main']['temp_min'];
          _isLoading = false;
          _hasError = false;
          _isLocationSelected = true;
        });
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _isLocationSelected = false;
      });
    }
  }

  Future<void> _showSearchDialog() async {
    String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _searchController = TextEditingController();
        return AlertDialog(
          title: Text('Search Location'),
          content: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Enter Location',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_searchController.text);
              },
              child: Text('Search'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      _fetchWeatherData(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Weather App'),
          backgroundColor: Color(0xFF7C51FE),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _showSearchDialog,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF512FA7), Color(0xFF9170cb)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLocationSelected
                    ? Column(
                        children: [
                          Text(
                            _location,
                            style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Updated: ${TimeOfDay.now().format(context)}',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          Image.network(
                            _iconUrl,
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Temperature: $_temperature °C',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Max: $_tempMax °  Min: $_tempMin °',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '$_description',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ],
                      )
                    : Text(
                        'No location selected',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                if (_isLoading) CircularProgressIndicator(),
                if (_hasError)
                  Text(
                    'Error fetching weather data',
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
