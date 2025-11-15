class ConversionFormulas {
  // Length formulas
  static Map<String, String> getLengthFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Meters-Kilometers': 'kilometers = meters ÷ 1000',
      'Kilometers-Meters': 'meters = kilometers × 1000',
      'Meters-Centimeters': 'centimeters = meters × 100',
      'Centimeters-Meters': 'meters = centimeters ÷ 100',
      'Meters-Millimeters': 'millimeters = meters × 1000',
      'Millimeters-Meters': 'meters = millimeters ÷ 1000',
      'Meters-Inches': 'inches = meters × 39.3701',
      'Inches-Meters': 'meters = inches ÷ 39.3701',
      'Meters-Feet': 'feet = meters × 3.28084',
      'Feet-Meters': 'meters = feet ÷ 3.28084',
      'Meters-Yards': 'yards = meters × 1.09361',
      'Yards-Meters': 'meters = yards ÷ 1.09361',
      'Meters-Miles': 'miles = meters ÷ 1609.34',
      'Miles-Meters': 'meters = miles × 1609.34',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Temperature formulas
  static Map<String, String> getTemperatureFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Celsius-Fahrenheit': '°F = (°C × 9/5) + 32',
      'Fahrenheit-Celsius': '°C = (°F - 32) × 5/9',
      'Celsius-Kelvin': 'K = °C + 273.15',
      'Kelvin-Celsius': '°C = K - 273.15',
      'Fahrenheit-Kelvin': 'K = (°F - 32) × 5/9 + 273.15',
      'Kelvin-Fahrenheit': '°F = (K - 273.15) × 9/5 + 32',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Weight formulas
  static Map<String, String> getWeightFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Kilograms-Grams': 'grams = kilograms × 1000',
      'Grams-Kilograms': 'kilograms = grams ÷ 1000',
      'Kilograms-Milligrams': 'milligrams = kilograms × 1,000,000',
      'Milligrams-Kilograms': 'kilograms = milligrams ÷ 1,000,000',
      'Kilograms-Pounds': 'pounds = kilograms × 2.20462',
      'Pounds-Kilograms': 'kilograms = pounds ÷ 2.20462',
      'Kilograms-Ounces': 'ounces = kilograms × 35.274',
      'Ounces-Kilograms': 'kilograms = ounces ÷ 35.274',
      'Kilograms-Tons': 'tons = kilograms ÷ 1000',
      'Tons-Kilograms': 'kilograms = tons × 1000',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Area formulas
  static Map<String, String> getAreaFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Square Meters-Square Kilometers': 'km² = m² ÷ 1,000,000',
      'Square Kilometers-Square Meters': 'm² = km² × 1,000,000',
      'Square Meters-Square Feet': 'ft² = m² × 10.7639',
      'Square Feet-Square Meters': 'm² = ft² ÷ 10.7639',
      'Square Meters-Square Inches': 'in² = m² × 1550.0031',
      'Square Inches-Square Meters': 'm² = in² ÷ 1550.0031',
      'Square Meters-Square Yards': 'yd² = m² × 1.19599',
      'Square Yards-Square Meters': 'm² = yd² ÷ 1.19599',
      'Square Meters-Acres': 'acres = m² ÷ 4046.86',
      'Acres-Square Meters': 'm² = acres × 4046.86',
      'Square Meters-Hectares': 'hectares = m² ÷ 10,000',
      'Hectares-Square Meters': 'm² = hectares × 10,000',
      'Square Kilometers-Square Miles': 'mi² = km² ÷ 2.58999',
      'Square Miles-Square Kilometers': 'km² = mi² × 2.58999',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Volume formulas
  static Map<String, String> getVolumeFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Liters-Milliliters': 'ml = liters × 1000',
      'Milliliters-Liters': 'liters = ml ÷ 1000',
      'Liters-Gallons': 'gallons = liters × 0.264172',
      'Gallons-Liters': 'liters = gallons ÷ 0.264172',
      'Liters-Fluid Ounces': 'fl oz = liters × 33.814',
      'Fluid Ounces-Liters': 'liters = fl oz ÷ 33.814',
      'Liters-Cubic Meters': 'm³ = liters ÷ 1000',
      'Cubic Meters-Liters': 'liters = m³ × 1000',
      'Liters-Cubic Feet': 'ft³ = liters × 0.0353147',
      'Cubic Feet-Liters': 'liters = ft³ ÷ 0.0353147',
      'Liters-Cubic Inches': 'in³ = liters × 61.0237',
      'Cubic Inches-Liters': 'liters = in³ ÷ 61.0237',
      'Liters-Quarts': 'quarts = liters × 1.05669',
      'Quarts-Liters': 'liters = quarts ÷ 1.05669',
      'Liters-Pints': 'pints = liters × 2.11338',
      'Pints-Liters': 'liters = pints ÷ 2.11338',
      'Liters-Cups': 'cups = liters × 4.22675',
      'Cups-Liters': 'liters = cups ÷ 4.22675',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Digital Storage formulas
  static Map<String, String> getDigitalStorageFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Bytes-Kilobytes': 'KB = bytes ÷ 1024',
      'Kilobytes-Bytes': 'bytes = KB × 1024',
      'Kilobytes-Megabytes': 'MB = KB ÷ 1024',
      'Megabytes-Kilobytes': 'KB = MB × 1024',
      'Megabytes-Gigabytes': 'GB = MB ÷ 1024',
      'Gigabytes-Megabytes': 'MB = GB × 1024',
      'Gigabytes-Terabytes': 'TB = GB ÷ 1024',
      'Terabytes-Gigabytes': 'GB = TB × 1024',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Time formulas
  static Map<String, String> getTimeFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Seconds-Minutes': 'minutes = seconds ÷ 60',
      'Minutes-Seconds': 'seconds = minutes × 60',
      'Minutes-Hours': 'hours = minutes ÷ 60',
      'Hours-Minutes': 'minutes = hours × 60',
      'Hours-Days': 'days = hours ÷ 24',
      'Days-Hours': 'hours = days × 24',
      'Seconds-Hours': 'hours = seconds ÷ 3600',
      'Hours-Seconds': 'seconds = hours × 3600',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Speed formulas
  static Map<String, String> getSpeedFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'km/h-mph': 'mph = km/h ÷ 1.60934',
      'mph-km/h': 'km/h = mph × 1.60934',
      'km/h-m/s': 'm/s = km/h ÷ 3.6',
      'm/s-km/h': 'km/h = m/s × 3.6',
      'km/h-knots': 'knots = km/h ÷ 1.852',
      'knots-km/h': 'km/h = knots × 1.852',
      'mph-m/s': 'm/s = mph ÷ 2.23694',
      'm/s-mph': 'mph = m/s × 2.23694',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }

  // Energy formulas
  static Map<String, String> getEnergyFormulas(String fromUnit, String toUnit) {
    final formulas = {
      'Joules-Calories': 'calories = joules ÷ 4.184',
      'Calories-Joules': 'joules = calories × 4.184',
      'Joules-Kilojoules': 'kJ = joules ÷ 1000',
      'Kilojoules-Joules': 'joules = kJ × 1000',
      'Calories-Kilocalories': 'kcal = calories ÷ 1000',
      'Kilocalories-Calories': 'calories = kcal × 1000',
      'Joules-Watthours': 'Wh = joules ÷ 3600',
      'Watthours-Joules': 'joules = Wh × 3600',
    };
    return {'formula': formulas['$fromUnit-$toUnit'] ?? 'value = input (same unit)'};
  }
}