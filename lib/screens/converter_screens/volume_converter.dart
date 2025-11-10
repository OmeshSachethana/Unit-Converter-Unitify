import 'package:flutter/material.dart';
import '../../widgets/ad_banner.dart';

class VolumeConverter extends StatefulWidget {
  const VolumeConverter({Key? key}) : super(key: key);

  @override
  State<VolumeConverter> createState() => _VolumeConverterState();
}

class _VolumeConverterState extends State<VolumeConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  bool _toLiters = true;

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = _toLiters ? input / 1000 : input * 1000; // mL ↔ L
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
            DropdownButton<bool>(
              value: _toLiters,
              items: const [
                DropdownMenuItem(value: true, child: Text('Milliliters → Liters')),
                DropdownMenuItem(value: false, child: Text('Liters → Milliliters')),
              ],
              onChanged: (val) => setState(() => _toLiters = val!),
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
