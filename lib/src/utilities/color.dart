import 'dart:ui';

colorToJson(Color color) {
  return color.getValue;
}

Color colorFromJson(int value) {
  return Color(value);
}

extension on Color {
  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  int get getValue =>
      _floatToInt8(a) << 24 |
      _floatToInt8(r) << 16 |
      _floatToInt8(g) << 8 |
      _floatToInt8(b) << 0;
}

String colorToHex(Color color) {
  return '${(color.r * 255.0).round().clamp(0, 255).toRadixString(16).padLeft(2, '0')}'
      '${(color.r * 255.0).round().clamp(0, 255).toRadixString(16).padLeft(2, '0')}'
      '${(color.r * 255.0).round().clamp(0, 255).toRadixString(16).padLeft(2, '0')}';
}
