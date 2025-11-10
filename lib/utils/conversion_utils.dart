class ConversionUtils {
  // Length
  static double metersToKilometers(double value) => value / 1000;
  static double kilometersToMeters(double value) => value * 1000;

  // Weight
  static double gramsToKilograms(double value) => value / 1000;
  static double kilogramsToGrams(double value) => value * 1000;

  // Temperature
  static double celsiusToFahrenheit(double value) => (value * 9 / 5) + 32;
  static double fahrenheitToCelsius(double value) => (value - 32) * 5 / 9;
}
