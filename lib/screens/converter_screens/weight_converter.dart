import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
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
    if (input == null) return;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Converter'),
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
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
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
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Result: ${_result.toStringAsFixed(6)}', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}