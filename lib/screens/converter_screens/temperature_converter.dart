import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
import '../../utils/conversion_formulas.dart';
import '../../widgets/ad_banner.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  String _conversionFormula = '';
  String _conversionExplanation = '';

  final List<String> _temperatureUnits = [
    'Celsius',
    'Fahrenheit',
    'Kelvin'
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

    // Handle all conversion combinations
    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      result = ConversionUtils.celsiusToFahrenheit(input);
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
      result = ConversionUtils.celsiusToKelvin(input);
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      result = ConversionUtils.fahrenheitToCelsius(input);
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
      result = ConversionUtils.fahrenheitToKelvin(input);
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
      result = ConversionUtils.kelvinToCelsius(input);
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
      result = ConversionUtils.kelvinToFahrenheit(input);
    } else {
      result = input; // Same unit
    }

    setState(() {
      _result = result;
      _conversionFormula = ConversionFormulas.getTemperatureFormulas(_fromUnit, _toUnit)['formula']!;
      _conversionExplanation = _getConversionExplanation(input, result);
    });
  }

  String _getConversionExplanation(double input, double result) {
    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      return 'To convert Celsius to Fahrenheit: Multiply by 9/5, then add 32. Water freezes at 0°C (32°F) and boils at 100°C (212°F).';
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      return 'To convert Fahrenheit to Celsius: Subtract 32, then multiply by 5/9. Water freezes at 32°F (0°C) and boils at 212°F (100°C).';
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
      return 'To convert Celsius to Kelvin: Add 273.15. Absolute zero is -273.15°C (0K). Kelvin uses the same increment as Celsius.';
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
      return 'To convert Kelvin to Celsius: Subtract 273.15. Absolute zero is 0K (-273.15°C). Kelvin uses the same increment as Celsius.';
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
      return 'To convert Fahrenheit to Kelvin: Subtract 32, multiply by 5/9, then add 273.15. Combines both conversion formulas.';
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
      return 'To convert Kelvin to Fahrenheit: Subtract 273.15, multiply by 9/5, then add 32. Combines both conversion formulas.';
    } else if (_fromUnit == _toUnit) {
      return 'Same unit conversion - no calculation needed.';
    }
    return 'Temperature conversion between $_fromUnit and $_toUnit scales.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        backgroundColor: Colors.orange,
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
                                  borderSide: const BorderSide(color: Colors.orange),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                prefixIcon: const Icon(Icons.thermostat, color: Colors.orange),
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
                                            items: _temperatureUnits.map((String unit) {
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
                                            items: _temperatureUnits.map((String unit) {
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
                                  backgroundColor: Colors.orange,
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
                                    Icon(Icons.calculate, color: Colors.orange, size: 20),
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
                                    color: Colors.orange[50],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.orange[100]!),
                                  ),
                                  child: Text(
                                    _conversionFormula,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
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
                              _result.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange,
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