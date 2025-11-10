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
  bool _toKg = true;

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = _toKg
          ? ConversionUtils.gramsToKilograms(input)
          : ConversionUtils.kilogramsToGrams(input);
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
            DropdownButton<bool>(
              value: _toKg,
              items: const [
                DropdownMenuItem(value: true, child: Text('Grams → Kilograms')),
                DropdownMenuItem(value: false, child: Text('Kilograms → Grams')),
              ],
              onChanged: (val) => setState(() => _toKg = val!),
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
