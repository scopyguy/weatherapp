import 'package:flutter/material.dart';

class ScreenMaterial extends StatelessWidget {
  const ScreenMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: const Column(
            children: [
              Text(
                'Humidity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                '105',
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: const Column(
            children: [
              Text(
                'Wind Speed',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Icon(
                Icons.wind_power,
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: const Column(
            children: [
              Text(
                'Pressure',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Icon(
                Icons.umbrella_sharp,
                size: 75,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '97',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
