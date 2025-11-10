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
      {'name': 'Length', 'screen': const LengthConverter(), 'icon': Icons.straighten, 'color': Colors.blue},
      {'name': 'Weight', 'screen': const WeightConverter(), 'icon': Icons.fitness_center, 'color': Colors.green},
      {'name': 'Temperature', 'screen': const TemperatureConverter(), 'icon': Icons.thermostat, 'color': Colors.orange},
      {'name': 'Area', 'screen': const AreaConverter(), 'icon': Icons.crop_square, 'color': Colors.purple},
      {'name': 'Volume', 'screen': const VolumeConverter(), 'icon': Icons.water_drop, 'color': Colors.cyan},
      {'name': 'Time', 'screen': const TimeConverter(), 'icon': Icons.access_time, 'color': Colors.indigo},
      {'name': 'Speed', 'screen': const SpeedConverter(), 'icon': Icons.speed, 'color': Colors.red},
      {'name': 'Digital Storage', 'screen': const DigitalStorageConverter(), 'icon': Icons.sd_storage, 'color': Colors.blueGrey},
      {'name': 'Currency', 'screen': const CurrencyConverter(), 'icon': Icons.currency_exchange, 'color': Colors.lightGreen},
      {'name': 'Energy', 'screen': const EnergyConverter(), 'icon': Icons.bolt, 'color': Colors.amber},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter – Unitify'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 4, 32),
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Convert between different units easily',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: converters.length,
              itemBuilder: (context, index) {
                final converter = converters[index];
                return Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => converter['screen'] as Widget,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            converter['color'] as Color,
                            (converter['color'] as Color).withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            converter['icon'] as IconData,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            converter['name'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
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