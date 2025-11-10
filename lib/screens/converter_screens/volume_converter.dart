import 'package:flutter/material.dart';
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
    if (input == null) return;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume Converter'),
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
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
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