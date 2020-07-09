import 'dart:collection';

import 'dart:math';

List<num> rgb(ListBase<num> xyz) {
  final x = xyz[0] / 100;
  final y = xyz[1] / 100;
  final z = xyz[2] / 100;
  double r, g, b;

  r = (x * 3.2404542) + (y * -1.5371385) + (z * -0.4985314);
  g = (x * -0.969266) + (y * 1.8760108) + (z * 0.041556);
  b = (x * 0.0556434) + (y * -0.2040259) + (z * 1.0572252);

  // Assume sRGB
  r = r > 0.0031308 ? ((1.055 * pow(r, (1.0 / 2.4))) - 0.055) : r * 12.92;

  g = g > 0.0031308 ? ((1.055 * pow(g, (1.0 / 2.4))) - 0.055) : g * 12.92;

  b = b > 0.0031308 ? ((1.055 * pow(b, (1.0 / 2.4))) - 0.055) : b * 12.92;

  r = min(max(0, r), 1);
  g = min(max(0, g), 1);
  b = min(max(0, b), 1);

  return [r * 255, g * 255, b * 255];
}

List<num> lab(ListBase<num> xyz) {
  var x = xyz[0];
  var y = xyz[1];
  var z = xyz[2];

  x /= 95.047;
  y /= 100;
  z /= 108.883;

  x = x > 0.008856 ? pow(x, (1 / 3)) : (7.787 * x) + (16 / 116);
  y = y > 0.008856 ? pow(y, (1 / 3)) : (7.787 * y) + (16 / 116);
  z = z > 0.008856 ? pow(z, (1 / 3)) : (7.787 * z) + (16 / 116);

  final l = (116 * y) - 16;
  final a = 500 * (x - y);
  final b = 200 * (y - z);

  return [l, a, b];
}
