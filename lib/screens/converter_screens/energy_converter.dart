import 'package:flutter/material.dart';
import '../../utils/conversion_utils.dart';
import '../../widgets/ad_banner.dart';

class EnergyConverter extends StatefulWidget {
  const EnergyConverter({Key? key}) : super(key: key);

  @override
  State<EnergyConverter> createState() => _EnergyConverterState();
}

class _EnergyConverterState extends State<EnergyConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _fromUnit = 'Joules';
  String _toUnit = 'Calories';
  
  final List<String> _units = ['Joules', 'Calories', 'Kilojoules', 'Kilocalories', 'Watthours'];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    setState(() {
      _result = ConversionUtils.convertEnergy(input, _fromUnit, _toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Converter'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shadowColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter value',
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.amber),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        prefixIcon: const Icon(Icons.bolt, color: Colors.amber),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'From',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.grey[50],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: DropdownButton<String>(
                                    value: _fromUnit,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    items: _units.map((String unit) {
                                      return DropdownMenuItem(
                                        value: unit,
                                        child: Text(unit),
                                      );
                                    }).toList(),
                                    onChanged: (val) => setState(() => _fromUnit = val!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'To',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.grey[50],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: DropdownButton<String>(
                                    value: _toUnit,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    items: _units.map((String unit) {
                                      return DropdownMenuItem(
                                        value: unit,
                                        child: Text(unit),
                                      );
                                    }).toList(),
                                    onChanged: (val) => setState(() => _toUnit = val!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _convert,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Convert',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _result.toStringAsFixed(6),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.amber,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _toUnit,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}