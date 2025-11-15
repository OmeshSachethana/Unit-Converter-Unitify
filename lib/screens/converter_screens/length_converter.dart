import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
import '../../utils/conversion_formulas.dart';
import '../../widgets/ad_banner.dart';

class LengthConverter extends StatefulWidget {
  const LengthConverter({Key? key}) : super(key: key);

  @override
  State<LengthConverter> createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Meters';
  String _toUnit = 'Kilometers';
  String _conversionFormula = '';
  String _conversionExplanation = '';

  final List<String> _lengthUnits = [
    'Meters',
    'Kilometers',
    'Centimeters',
    'Millimeters',
    'Inches',
    'Feet',
    'Yards',
    'Miles'
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

    double result = 0.0;

    // Convert to meters first
    double valueInMeters;
    switch (_fromUnit) {
      case 'Meters':
        valueInMeters = input;
        break;
      case 'Kilometers':
        valueInMeters = ConversionUtils.kilometersToMeters(input);
        break;
      case 'Centimeters':
        valueInMeters = ConversionUtils.centimetersToMeters(input);
        break;
      case 'Millimeters':
        valueInMeters = ConversionUtils.millimetersToMeters(input);
        break;
      case 'Inches':
        valueInMeters = ConversionUtils.inchesToMeters(input);
        break;
      case 'Feet':
        valueInMeters = ConversionUtils.feetToMeters(input);
        break;
      case 'Yards':
        valueInMeters = ConversionUtils.yardsToMeters(input);
        break;
      case 'Miles':
        valueInMeters = ConversionUtils.milesToMeters(input);
        break;
      default:
        valueInMeters = input;
    }

    // Convert from meters to target unit
    switch (_toUnit) {
      case 'Meters':
        result = valueInMeters;
        break;
      case 'Kilometers':
        result = ConversionUtils.metersToKilometers(valueInMeters);
        break;
      case 'Centimeters':
        result = ConversionUtils.metersToCentimeters(valueInMeters);
        break;
      case 'Millimeters':
        result = ConversionUtils.metersToMillimeters(valueInMeters);
        break;
      case 'Inches':
        result = ConversionUtils.metersToInches(valueInMeters);
        break;
      case 'Feet':
        result = ConversionUtils.metersToFeet(valueInMeters);
        break;
      case 'Yards':
        result = ConversionUtils.metersToYards(valueInMeters);
        break;
      case 'Miles':
        result = ConversionUtils.metersToMiles(valueInMeters);
        break;
      default:
        result = valueInMeters;
    }

    setState(() {
      _result = result;
      _conversionFormula = ConversionFormulas.getLengthFormulas(_fromUnit, _toUnit)['formula']!;
      _conversionExplanation = _getConversionExplanation(input, result);
    });
  }

  String _getConversionExplanation(double input, double result) {
    if (_fromUnit == 'Meters' && _toUnit == 'Kilometers') {
      return 'There are 1000 meters in 1 kilometer. To convert meters to kilometers, divide by 1000.';
    } else if (_fromUnit == 'Kilometers' && _toUnit == 'Meters') {
      return 'There are 1000 meters in 1 kilometer. To convert kilometers to meters, multiply by 1000.';
    } else if (_fromUnit == 'Meters' && _toUnit == 'Centimeters') {
      return 'There are 100 centimeters in 1 meter. To convert meters to centimeters, multiply by 100.';
    } else if (_fromUnit == 'Centimeters' && _toUnit == 'Meters') {
      return 'There are 100 centimeters in 1 meter. To convert centimeters to meters, divide by 100.';
    } else if (_fromUnit == 'Meters' && _toUnit == 'Feet') {
      return '1 meter equals approximately 3.28084 feet. To convert meters to feet, multiply by 3.28084.';
    } else if (_fromUnit == 'Feet' && _toUnit == 'Meters') {
      return '1 foot equals approximately 0.3048 meters. To convert feet to meters, divide by 3.28084.';
    } else if (_fromUnit == 'Meters' && _toUnit == 'Inches') {
      return '1 meter equals approximately 39.3701 inches. To convert meters to inches, multiply by 39.3701.';
    } else if (_fromUnit == 'Inches' && _toUnit == 'Meters') {
      return '1 inch equals approximately 0.0254 meters. To convert inches to meters, divide by 39.3701.';
    } else if (_fromUnit == 'Meters' && _toUnit == 'Miles') {
      return '1 mile equals 1609.34 meters. To convert meters to miles, divide by 1609.34.';
    } else if (_fromUnit == 'Miles' && _toUnit == 'Meters') {
      return '1 mile equals 1609.34 meters. To convert miles to meters, multiply by 1609.34.';
    } else if (_fromUnit == _toUnit) {
      return 'Same unit conversion - no calculation needed.';
    }
    return 'Conversion between $_fromUnit and $_toUnit using standard conversion factors.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Length Converter'),
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
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                prefixIcon: const Icon(Icons.straighten, color: Colors.blue),
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
                                            items: _lengthUnits.map((String unit) {
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
                                            items: _lengthUnits.map((String unit) {
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
                                  backgroundColor: Colors.blue,
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
                                    Icon(Icons.calculate, color: Colors.blue, size: 20),
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
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.blue[100]!),
                                  ),
                                  child: Text(
                                    _conversionFormula,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
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
                                color: Colors.blue,
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