class ConversionUtils {
  // Length conversions
  static double metersToKilometers(double value) => value / 1000;
  static double kilometersToMeters(double value) => value * 1000;
  static double metersToCentimeters(double value) => value * 100;
  static double centimetersToMeters(double value) => value / 100;
  static double metersToMillimeters(double value) => value * 1000;
  static double millimetersToMeters(double value) => value / 1000;
  static double metersToInches(double value) => value * 39.37007874;
  static double inchesToMeters(double value) => value / 39.37007874;
  static double metersToFeet(double value) => value * 3.280839895;
  static double feetToMeters(double value) => value / 3.280839895;
  static double metersToYards(double value) => value * 1.09361;
  static double yardsToMeters(double value) => value / 1.09361;
  static double metersToMiles(double value) => value / 1609.34;
  static double milesToMeters(double value) => value * 1609.34;

  // Weight conversions
  static double gramsToKilograms(double value) => value / 1000;
  static double kilogramsToGrams(double value) => value * 1000;
  static double gramsToMilligrams(double value) => value * 1000;
  static double milligramsToGrams(double value) => value / 1000;
  static double kilogramsToPounds(double value) => value * 2.20462;
  static double poundsToKilograms(double value) => value / 2.20462;
  static double kilogramsToOunces(double value) => value * 35.274;
  static double ouncesToKilograms(double value) => value / 35.274;
  static double kilogramsToTons(double value) => value / 1000;
  static double tonsToKilograms(double value) => value * 1000;

  // Temperature conversions
  static double celsiusToFahrenheit(double value) => (value * 9 / 5) + 32;
  static double fahrenheitToCelsius(double value) => (value - 32) * 5 / 9;
  static double celsiusToKelvin(double value) => value + 273.15;
  static double kelvinToCelsius(double value) => value - 273.15;
  static double fahrenheitToKelvin(double value) => (value - 32) * 5 / 9 + 273.15;
  static double kelvinToFahrenheit(double value) => (value - 273.15) * 9 / 5 + 32;

  // Area conversions
  static double squareMetersToSquareKilometers(double value) => value / 1e6;
  static double squareKilometersToSquareMeters(double value) => value * 1e6;
  static double squareMetersToSquareFeet(double value) => value * 10.7639;
  static double squareFeetToSquareMeters(double value) => value / 10.7639;
  static double squareMetersToSquareInches(double value) => value * 1550.0031;
  static double squareInchesToSquareMeters(double value) => value / 1550.0031;
  static double squareMetersToSquareYards(double value) => value * 1.19599;
  static double squareYardsToSquareMeters(double value) => value / 1.19599;
  static double squareMetersToAcres(double value) => value / 4046.86;
  static double acresToSquareMeters(double value) => value * 4046.86;
  static double squareMetersToHectares(double value) => value / 10000;
  static double hectaresToSquareMeters(double value) => value * 10000;
  static double squareKilometersToSquareMiles(double value) => value / 2.58999;
  static double squareMilesToSquareKilometers(double value) => value * 2.58999;

  // Volume conversions
  static double millilitersToLiters(double value) => value / 1000;
  static double litersToMilliliters(double value) => value * 1000;
  static double litersToGallons(double value) => value * 0.264172;
  static double gallonsToLiters(double value) => value / 0.264172;
  static double litersToFluidOunces(double value) => value * 33.8140227;
  static double fluidOuncesToLiters(double value) => value / 33.8140227;
  static double litersToCubicMeters(double value) => value / 1000;
  static double cubicMetersToLiters(double value) => value * 1000;
  static double litersToCubicFeet(double value) => value * 0.0353147;
  static double cubicFeetToLiters(double value) => value / 0.0353147;
  static double litersToCubicInches(double value) => value * 61.0237;
  static double cubicInchesToLiters(double value) => value / 61.0237;
  static double litersToPints(double value) => value * 2.11338;
  static double pintsToLiters(double value) => value / 2.11338;
  static double litersToQuarts(double value) => value * 1.05669;
  static double quartsToLiters(double value) => value / 1.05669;
  static double litersToCups(double value) => value * 4.22675;
  static double cupsToLiters(double value) => value / 4.22675;

  // Time conversions
  static double convertTime(double value, String fromUnit, String toUnit) {
    double valueInSeconds;
    switch (fromUnit) {
      case 'Seconds':
        valueInSeconds = value;
        break;
      case 'Minutes':
        valueInSeconds = value * 60;
        break;
      case 'Hours':
        valueInSeconds = value * 3600;
        break;
      case 'Days':
        valueInSeconds = value * 86400;
        break;
      default:
        valueInSeconds = value;
    }

    switch (toUnit) {
      case 'Seconds':
        return valueInSeconds;
      case 'Minutes':
        return valueInSeconds / 60;
      case 'Hours':
        return valueInSeconds / 3600;
      case 'Days':
        return valueInSeconds / 86400;
      default:
        return valueInSeconds;
    }
  }


  // Speed conversions
  static double convertSpeed(double value, String fromUnit, String toUnit) {
    double valueInKmh;
    switch (fromUnit) {
      case 'km/h':
        valueInKmh = value;
        break;
      case 'mph':
        valueInKmh = value * 1.60934;
        break;
      case 'm/s':
        valueInKmh = value * 3.6;
        break;
      case 'knots':
        valueInKmh = value * 1.852;
        break;
      default:
        valueInKmh = value;
    }

    switch (toUnit) {
      case 'km/h':
        return valueInKmh;
      case 'mph':
        return valueInKmh / 1.60934;
      case 'm/s':
        return valueInKmh / 3.6;
      case 'knots':
        return valueInKmh / 1.852;
      default:
        return valueInKmh;
    }
  }

  // Digital Storage conversions
  static double convertDigitalStorage(double value, String fromUnit, String toUnit) {
    double valueInBytes;
    switch (fromUnit) {
      case 'Bytes':
        valueInBytes = value;
        break;
      case 'Kilobytes':
        valueInBytes = value * 1024;
        break;
      case 'Megabytes':
        valueInBytes = value * 1024 * 1024;
        break;
      case 'Gigabytes':
        valueInBytes = value * 1024 * 1024 * 1024;
        break;
      case 'Terabytes':
        valueInBytes = value * 1024 * 1024 * 1024 * 1024;
        break;
      default:
        valueInBytes = value;
    }

    switch (toUnit) {
      case 'Bytes':
        return valueInBytes;
      case 'Kilobytes':
        return valueInBytes / 1024;
      case 'Megabytes':
        return valueInBytes / (1024 * 1024);
      case 'Gigabytes':
        return valueInBytes / (1024 * 1024 * 1024);
      case 'Terabytes':
        return valueInBytes / (1024 * 1024 * 1024 * 1024);
      default:
        return valueInBytes;
    }
  }

  // Currency conversions
  static double convertCurrency(double value, String fromCurrency, String toCurrency) {
    final Map<String, double> rates = {
      'USD': 1.0,
      'EUR': 0.85,
      'GBP': 0.73,
      'JPY': 110.0,
      'CAD': 1.25,
      'AUD': 1.35,
    };

    if (!rates.containsKey(fromCurrency) || !rates.containsKey(toCurrency)) {
      return value;
    }

    double valueInUSD = value / rates[fromCurrency]!;
    return valueInUSD * rates[toCurrency]!;
  }

  // Energy conversions
  static double convertEnergy(double value, String fromUnit, String toUnit) {
    double valueInJoules;
    switch (fromUnit) {
      case 'Joules':
        valueInJoules = value;
        break;
      case 'Calories':
        valueInJoules = value * 4.184;
        break;
      case 'Kilojoules':
        valueInJoules = value * 1000;
        break;
      case 'Kilocalories':
        valueInJoules = value * 4184;
        break;
      case 'Watthours':
        valueInJoules = value * 3600;
        break;
      default:
        valueInJoules = value;
    }

    switch (toUnit) {
      case 'Joules':
        return valueInJoules;
      case 'Calories':
        return valueInJoules / 4.184;
      case 'Kilojoules':
        return valueInJoules / 1000;
      case 'Kilocalories':
        return valueInJoules / 4184;
      case 'Watthours':
        return valueInJoules / 3600;
      default:
        return valueInJoules;
    }
  }

  // Pressure conversions
  static double convertPressure(double value, String fromUnit, String toUnit) {
    // Convert to pascals first
    double valueInPascals;
    switch (fromUnit) {
      case 'Pascal':
        valueInPascals = value;
        break;
      case 'Bar':
        valueInPascals = value * 100000;
        break;
      case 'PSI':
        valueInPascals = value * 6894.76;
        break;
      case 'Atmosphere':
        valueInPascals = value * 101325;
        break;
      default:
        valueInPascals = value;
    }

    // Convert from pascals to target unit
    switch (toUnit) {
      case 'Pascal':
        return valueInPascals;
      case 'Bar':
        return valueInPascals / 100000;
      case 'PSI':
        return valueInPascals / 6894.76;
      case 'Atmosphere':
        return valueInPascals / 101325;
      default:
        return valueInPascals;
    }
  }
}
