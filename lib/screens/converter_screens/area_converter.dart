import 'package:flutter/material.dart';
import '../../widgets/ad_banner.dart';

class AreaConverter extends StatefulWidget {
  const AreaConverter({Key? key}) : super(key: key);

  @override
  State<AreaConverter> createState() => _AreaConverterState();
}

class _AreaConverterState extends State<AreaConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  bool _toSqKm = true;

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = _toSqKm ? input / 1e6 : input * 1e6; // m² ↔ km²
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
            DropdownButton<bool>(
              value: _toSqKm,
              items: const [
                DropdownMenuItem(value: true, child: Text('m² → km²')),
                DropdownMenuItem(value: false, child: Text('km² → m²')),
              ],
              onChanged: (val) => setState(() => _toSqKm = val!),
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
