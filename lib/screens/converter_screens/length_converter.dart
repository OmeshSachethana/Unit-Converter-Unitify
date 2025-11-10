import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
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
    if (input == null) return;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Length Converter'),
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
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
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