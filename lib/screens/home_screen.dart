import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'about_screen.dart';
import 'privacy_policy_screen.dart';

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
        backgroundColor: const Color.fromARGB(255, 8, 5, 49),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        shadowColor: Colors.black12,
      ),
      drawer: _buildDrawer(context),
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 5, 49), // Plain solid color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // adjust radius as needed
                  child: Image.asset(
                    'assets/unitify_logo.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover, // looks better with rounded corners
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  'Unitify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Unit Converter App',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.orange),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share, color: Colors.purple),
            title: const Text('Share App'),
            onTap: () {
              Navigator.pop(context);
              _showShareDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review, color: Colors.amber),
            title: const Text('Rate App'),
            onTap: () {
              Navigator.pop(context);
              _showRateDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.grey),
            title: const Text('Exit'),
            onTap: () {
              Navigator.pop(context);
              _showExitDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Share Unitify'),
          content: const Text('Share this amazing unit converter app with your friends!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showRateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate Unitify'),
          content: const Text('If you enjoy using Unitify, please consider rating us on the app store!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showExitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              SystemNavigator.pop();  // Exit the app
            },
            child: const Text('Exit'),
          ),
        ],
      );
    },
  );
}
}