import 'package:flutter/material.dart';
import 'package:unit_converter_unitify/ads/admob_service.dart';
import '../../utils/conversion_utils.dart';
import '../../widgets/ad_banner.dart';

class VolumeConverter extends StatefulWidget {
  const VolumeConverter({Key? key}) : super(key: key);

  @override
  State<VolumeConverter> createState() => _VolumeConverterState();
}

class _VolumeConverterState extends State<VolumeConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Milliliters';
  String _toUnit = 'Liters';

  final List<String> _volumeUnits = [
    'Milliliters',
    'Liters',
    'Gallons',
    'Fluid Ounces',
    'Cubic Meters',
    'Cubic Feet',
    'Cubic Inches',
    'Quarts',
    'Pints',
    'Cups'
  ];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) {
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid number'))
      );
      return;
    }

    double valueInLiters;
    switch (_fromUnit) {
      case 'Milliliters':
        valueInLiters = ConversionUtils.millilitersToLiters(input);
        break;
      case 'Liters':
        valueInLiters = input;
        break;
      case 'Gallons':
        valueInLiters = ConversionUtils.gallonsToLiters(input);
        break;
      case 'Fluid Ounces':
        valueInLiters = ConversionUtils.fluidOuncesToLiters(input);
        break;
      case 'Cubic Meters':
        valueInLiters = ConversionUtils.cubicMetersToLiters(input);
        break;
      case 'Cubic Feet':
        valueInLiters = ConversionUtils.cubicFeetToLiters(input);
        break;
      case 'Cubic Inches':
        valueInLiters = ConversionUtils.cubicInchesToLiters(input);
        break;
      case 'Quarts':
        valueInLiters = ConversionUtils.quartsToLiters(input);
        break;
      case 'Pints':
        valueInLiters = ConversionUtils.pintsToLiters(input);
        break;
      case 'Cups':
        valueInLiters = ConversionUtils.cupsToLiters(input);
        break;
      default:
        valueInLiters = input;
    }

    double result;
    switch (_toUnit) {
      case 'Milliliters':
        result = ConversionUtils.litersToMilliliters(valueInLiters);
        break;
      case 'Liters':
        result = valueInLiters;
        break;
      case 'Gallons':
        result = ConversionUtils.litersToGallons(valueInLiters);
        break;
      case 'Fluid Ounces':
        result = ConversionUtils.litersToFluidOunces(valueInLiters);
        break;
      case 'Cubic Meters':
        result = ConversionUtils.litersToCubicMeters(valueInLiters);
        break;
      case 'Cubic Feet':
        result = ConversionUtils.litersToCubicFeet(valueInLiters);
        break;
      case 'Cubic Inches':
        result = ConversionUtils.litersToCubicInches(valueInLiters);
        break;
      case 'Quarts':
        result = ConversionUtils.litersToQuarts(valueInLiters);
        break;
      case 'Pints':
        result = ConversionUtils.litersToPints(valueInLiters);
        break;
      case 'Cups':
        result = ConversionUtils.litersToCups(valueInLiters);
        break;
      default:
        result = valueInLiters;
    }

    setState(() {
      _result = result;
    });

    // Track conversion for interstitial ads
    AdMobService.trackConversion();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume Converter'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
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
                  children: [
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Enter value',
                                labelStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Colors.cyan),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                prefixIcon: const Icon(Icons.water_drop, color: Colors.cyan),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'From',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.grey.shade300),
                                          color: Colors.grey[50],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: DropdownButton<String>(
                                            value: _fromUnit,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: _volumeUnits.map((String unit) {
                                              return DropdownMenuItem<String>(
                                                value: unit,
                                                child: Text(unit),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _fromUnit = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'To',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.grey.shade300),
                                          color: Colors.grey[50],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: DropdownButton<String>(
                                            value: _toUnit,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: _volumeUnits.map((String unit) {
                                              return DropdownMenuItem<String>(
                                                value: unit,
                                                child: Text(unit),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _toUnit = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _convert,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyan,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Convert',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              'Result',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _result.toStringAsFixed(6),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.cyan,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _toUnit,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
}