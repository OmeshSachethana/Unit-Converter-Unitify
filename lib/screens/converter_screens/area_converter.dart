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
    if (input == null) {
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid number'))
      );
      return;
    }

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
        elevation: 2,
        shadowColor: Colors.black12,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                                  borderSide: const BorderSide(color: Colors.purple),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                prefixIcon: const Icon(Icons.square_foot, color: Colors.purple),
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
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white,
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
                                color: Colors.purple,
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
                  ],
                ),
              ),
            ),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}