import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/secrets.dart';

import 'Hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = 'Nigeria';
      final res = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'),
      );

      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw ('An unexpected error occured');
      }
      setState(() {
        temp = data['list'][0]['main']['temp'];
        print('Temp updated: $temp ');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Weather Forecast',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temp K',
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            Icons.cloud,
                            size: 70,
                          ),
                          const Text(
                            'Rain',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HourlyForecastItem(
                    time: '03:00',
                    icon: Icons.cloud,
                    temperature: '301.22',
                  ),
                  HourlyForecastItem(
                    time: '05:00',
                    icon: Icons.sunny,
                    temperature: '301.40',
                  ),
                  HourlyForecastItem(
                    time: '07:36',
                    icon: Icons.cloud,
                    temperature: '301.58',
                  ),
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '302.19',
                  ),
                  HourlyForecastItem(
                    time: '12:20',
                    icon: Icons.cloud,
                    temperature: '302.25',
                  ),
                  HourlyForecastItem(
                    time: '15:00',
                    icon: Icons.sunny,
                    temperature: '302.45',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Addtional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 250,
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: const Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.water_drop,
                          size: 75,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '85',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: const Column(
                      children: [
                        Text(
                          'Wind Speed',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.air,
                          size: 75,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '95',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: const Column(
                      children: [
                        Text(
                          'Pressure',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.umbrella,
                          size: 75,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '108,3',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
