import 'package:flutter/material.dart';
import 'package:unit_converter_unitify/screens/converter_screens/currency_converter.dart';
import 'package:unit_converter_unitify/screens/converter_screens/digital_storage_converter.dart';
import 'package:unit_converter_unitify/screens/converter_screens/energy_converter.dart';
import 'package:unit_converter_unitify/screens/converter_screens/speed_converter.dart';
import 'package:unit_converter_unitify/screens/converter_screens/time_converter.dart';
import '../widgets/ad_banner.dart';
import 'converter_screens/length_converter.dart';
import 'converter_screens/weight_converter.dart';
import 'converter_screens/temperature_converter.dart';
import 'converter_screens/area_converter.dart';
import 'converter_screens/volume_converter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final converters = [
      {'name': 'Length', 'screen': const LengthConverter()},
      {'name': 'Weight', 'screen': const WeightConverter()},
      {'name': 'Temperature', 'screen': const TemperatureConverter()},
      {'name': 'Area', 'screen': const AreaConverter()},
      {'name': 'Volume', 'screen': const VolumeConverter()},
      {'name': 'Time', 'screen': const TimeConverter()},
      {'name': 'Speed', 'screen': const SpeedConverter()},
      {'name': 'Digital Storage', 'screen': const DigitalStorageConverter()},
      {'name': 'Currency', 'screen': const CurrencyConverter()},
      {'name': 'Energy', 'screen': const EnergyConverter()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter – Unitify'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: converters.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(converters[index]['name'] as String),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => converters[index]['screen'] as Widget,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const AdBanner(),
        ],
      ),
    );
  }
}
