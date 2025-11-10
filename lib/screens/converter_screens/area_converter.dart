import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
import '../../widgets/ad_banner.dart';

class AreaConverter extends StatefulWidget {
  const AreaConverter({Key? key}) : super(key: key);

  @override
  State<AreaConverter> createState() => _AreaConverterState();
}

class _AreaConverterState extends State<AreaConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Square Meters';
  String _toUnit = 'Square Kilometers';

  final List<String> _areaUnits = [
    'Square Meters',
    'Square Kilometers',
    'Square Feet',
    'Square Inches',
    'Square Yards',
    'Acres',
    'Hectares',
    'Square Miles'
  ];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    double valueInSquareMeters;
    switch (_fromUnit) {
      case 'Square Meters':
        valueInSquareMeters = input;
        break;
      case 'Square Kilometers':
        valueInSquareMeters = ConversionUtils.squareKilometersToSquareMeters(input);
        break;
      case 'Square Feet':
        valueInSquareMeters = ConversionUtils.squareFeetToSquareMeters(input);
        break;
      case 'Square Inches':
        valueInSquareMeters = ConversionUtils.squareInchesToSquareMeters(input);
        break;
      case 'Square Yards':
        valueInSquareMeters = ConversionUtils.squareYardsToSquareMeters(input);
        break;
      case 'Acres':
        valueInSquareMeters = ConversionUtils.acresToSquareMeters(input);
        break;
      case 'Hectares':
        valueInSquareMeters = ConversionUtils.hectaresToSquareMeters(input);
        break;
      case 'Square Miles':
        valueInSquareMeters = ConversionUtils.squareMilesToSquareKilometers(input) * 1e6;
        break;
      default:
        valueInSquareMeters = input;
    }

    double result;
    switch (_toUnit) {
      case 'Square Meters':
        result = valueInSquareMeters;
        break;
      case 'Square Kilometers':
        result = ConversionUtils.squareMetersToSquareKilometers(valueInSquareMeters);
        break;
      case 'Square Feet':
        result = ConversionUtils.squareMetersToSquareFeet(valueInSquareMeters);
        break;
      case 'Square Inches':
        result = ConversionUtils.squareMetersToSquareInches(valueInSquareMeters);
        break;
      case 'Square Yards':
        result = ConversionUtils.squareMetersToSquareYards(valueInSquareMeters);
        break;
      case 'Acres':
        result = ConversionUtils.squareMetersToAcres(valueInSquareMeters);
        break;
      case 'Hectares':
        result = ConversionUtils.squareMetersToHectares(valueInSquareMeters);
        break;
      case 'Square Miles':
        result = ConversionUtils.squareKilometersToSquareMiles(valueInSquareMeters / 1e6);
        break;
      default:
        result = valueInSquareMeters;
    }

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Converter'),
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
                    items: _areaUnits.map((String unit) {
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
                    items: _areaUnits.map((String unit) {
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