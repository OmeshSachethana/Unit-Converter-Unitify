import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
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

  final List<String> _temperatureUnits = [
    'Celsius',
    'Fahrenheit',
    'Kelvin'
  ];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _fromUnit,
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
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
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
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Result: ${_result.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}