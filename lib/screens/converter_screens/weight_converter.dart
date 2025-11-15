import 'package:flutter/material.dart';
import 'package:unit_converter_unitify/ads/admob_service.dart';
import '../../utils/conversion_utils.dart';
import '../../utils/conversion_formulas.dart';
import '../../widgets/ad_banner.dart';

class WeightConverter extends StatefulWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  State<WeightConverter> createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Grams';
  String _toUnit = 'Kilograms';
  String _conversionFormula = '';
  String _conversionExplanation = '';

  final List<String> _weightUnits = [
    'Grams',
    'Kilograms',
    'Milligrams',
    'Pounds',
    'Ounces',
    'Tons'
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

    double valueInKilograms;
    switch (_fromUnit) {
      case 'Grams':
        valueInKilograms = ConversionUtils.gramsToKilograms(input);
        break;
      case 'Kilograms':
        valueInKilograms = input;
        break;
      case 'Milligrams':
        valueInKilograms = input / 1000000;
        break;
      case 'Pounds':
        valueInKilograms = ConversionUtils.poundsToKilograms(input);
        break;
      case 'Ounces':
        valueInKilograms = ConversionUtils.ouncesToKilograms(input);
        break;
      case 'Tons':
        valueInKilograms = ConversionUtils.tonsToKilograms(input);
        break;
      default:
        valueInKilograms = input;
    }

    double result;
    switch (_toUnit) {
      case 'Grams':
        result = ConversionUtils.kilogramsToGrams(valueInKilograms);
        break;
      case 'Kilograms':
        result = valueInKilograms;
        break;
      case 'Milligrams':
        result = valueInKilograms * 1000000;
        break;
      case 'Pounds':
        result = ConversionUtils.kilogramsToPounds(valueInKilograms);
        break;
      case 'Ounces':
        result = ConversionUtils.kilogramsToOunces(valueInKilograms);
        break;
      case 'Tons':
        result = ConversionUtils.kilogramsToTons(valueInKilograms);
        break;
      default:
        result = valueInKilograms;
    }

    setState(() {
      _result = result;
      _conversionFormula = ConversionFormulas.getWeightFormulas(_fromUnit, _toUnit)['formula']!;
      _conversionExplanation = _getConversionExplanation(input, result);
    });

    // Track conversion for interstitial ads
    AdMobService.trackConversion();
    
  }

  String _getConversionExplanation(double input, double result) {
    if (_fromUnit == 'Grams' && _toUnit == 'Kilograms') {
      return 'There are 1000 grams in 1 kilogram. To convert grams to kilograms, divide by 1000.';
    } else if (_fromUnit == 'Kilograms' && _toUnit == 'Grams') {
      return 'There are 1000 grams in 1 kilogram. To convert kilograms to grams, multiply by 1000.';
    } else if (_fromUnit == 'Kilograms' && _toUnit == 'Pounds') {
      return '1 kilogram equals approximately 2.20462 pounds. To convert kilograms to pounds, multiply by 2.20462.';
    } else if (_fromUnit == 'Pounds' && _toUnit == 'Kilograms') {
      return '1 pound equals approximately 0.453592 kilograms. To convert pounds to kilograms, divide by 2.20462.';
    } else if (_fromUnit == 'Kilograms' && _toUnit == 'Ounces') {
      return '1 kilogram equals approximately 35.274 ounces. To convert kilograms to ounces, multiply by 35.274.';
    } else if (_fromUnit == 'Ounces' && _toUnit == 'Kilograms') {
      return '1 ounce equals approximately 0.0283495 kilograms. To convert ounces to kilograms, divide by 35.274.';
    } else if (_fromUnit == 'Kilograms' && _toUnit == 'Tons') {
      return 'There are 1000 kilograms in 1 metric ton. To convert kilograms to tons, divide by 1000.';
    } else if (_fromUnit == 'Tons' && _toUnit == 'Kilograms') {
      return 'There are 1000 kilograms in 1 metric ton. To convert tons to kilograms, multiply by 1000.';
    } else if (_fromUnit == _toUnit) {
      return 'Same unit conversion - no calculation needed.';
    }
    return 'Weight conversion between $_fromUnit and $_toUnit using standard conversion factors.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Converter'),
        backgroundColor: Colors.green,
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
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                prefixIcon: const Icon(Icons.fitness_center, color: Colors.green),
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
                                            items: _weightUnits.map((String unit) {
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
                                            items: _weightUnits.map((String unit) {
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
                                  backgroundColor: Colors.green,
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
                    
                    // Conversion Formula Card
                    if (_conversionFormula.isNotEmpty)
                    Column(
                      children: [
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.calculate, color: Colors.green, size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      'Conversion Formula',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.green[100]!),
                                  ),
                                  child: Text(
                                    _conversionFormula,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                      fontFamily: 'Monospace',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Row(
                                  children: [
                                    Icon(Icons.info_outline, color: Colors.green, size: 18),
                                    SizedBox(width: 8),
                                    Text(
                                      'How it works:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _conversionExplanation,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                                color: Colors.green,
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