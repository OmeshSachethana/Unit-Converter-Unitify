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
  bool _toKm = true;

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = _toKm
          ? ConversionUtils.metersToKilometers(input)
          : ConversionUtils.kilometersToMeters(input);
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
            DropdownButton<bool>(
              value: _toKm,
              items: const [
                DropdownMenuItem(value: true, child: Text('Meters → Kilometers')),
                DropdownMenuItem(value: false, child: Text('Kilometers → Meters')),
              ],
              onChanged: (val) => setState(() => _toKm = val!),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Result: $_result', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}
