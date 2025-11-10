import 'package:flutter/material.dart';
import '../widgets/ad_banner.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Unitify'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shadowColor: Colors.black12,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Icon and Name
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/unitify_logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Unitify',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Version 1.0.0',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // About Section
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Unitify',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Unitify is a comprehensive unit conversion app that helps you convert between various measurement units quickly and accurately. '
                              'Whether you\'re a student, professional, or just someone who needs to convert units in daily life, Unitify makes it simple and convenient.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Our mission is to provide a user-friendly, reliable, and free tool for all your unit conversion needs. '
                              'We support a wide range of categories including length, weight, temperature, area, volume, and more.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Features Section
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Key Features',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildFeatureItem('📏', 'Length Converter', 'Convert between meters, kilometers, feet, inches, miles, etc.'),
                            _buildFeatureItem('⚖️', 'Weight Converter', 'Convert between grams, kilograms, pounds, ounces, tons, etc.'),
                            _buildFeatureItem('🌡️', 'Temperature Converter', 'Convert between Celsius, Fahrenheit, and Kelvin.'),
                            _buildFeatureItem('📐', 'Area Converter', 'Convert between square meters, square feet, acres, hectares, etc.'),
                            _buildFeatureItem('💧', 'Volume Converter', 'Convert between liters, milliliters, gallons, fluid ounces, etc.'),
                            _buildFeatureItem('⏰', 'Time Converter', 'Convert between seconds, minutes, hours, and days.'),
                            _buildFeatureItem('💨', 'Speed Converter', 'Convert between km/h, mph, m/s, and knots.'),
                            _buildFeatureItem('💾', 'Digital Storage', 'Convert between bytes, kilobytes, megabytes, gigabytes, etc.'),
                            _buildFeatureItem('💵', 'Currency Converter', 'Convert between major world currencies.'),
                            _buildFeatureItem('⚡', 'Energy Converter', 'Convert between joules, calories, kilojoules, etc.'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Developer Info
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Developer Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                  color: Colors.black87,
                                ),
                                children: [
                                  const TextSpan(text: 'Unitify is developed with ❤️ by '),
                                  TextSpan(
                                    text: 'CodeByte Labs.',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(text: ' We are committed to providing regular updates and new features to enhance your experience.'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'If you have any suggestions, feedback, or encounter any issues, please don\'t hesitate to contact us.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.email, color: Colors.blue.shade600, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'codebyteslabs@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const AdBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String emoji, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
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