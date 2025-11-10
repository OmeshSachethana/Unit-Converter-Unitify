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
  bool _toFahrenheit = true;

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = _toFahrenheit
          ? ConversionUtils.celsiusToFahrenheit(input)
          : ConversionUtils.fahrenheitToCelsius(input);
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
            DropdownButton<bool>(
              value: _toFahrenheit,
              items: const [
                DropdownMenuItem(value: true, child: Text('Celsius → Fahrenheit')),
                DropdownMenuItem(value: false, child: Text('Fahrenheit → Celsius')),
              ],
              onChanged: (val) => setState(() => _toFahrenheit = val!),
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
