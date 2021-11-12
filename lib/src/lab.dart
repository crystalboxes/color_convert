import 'dart:collection';
import 'dart:math';

List<num?> xyz(ListBase<num> lab) {
  final l = lab[0];
  final a = lab[1];
  final b = lab[2];
  var x;
  var y;
  var z;

  y = (l + 16) / 116;
  x = a / 500 + y;
  z = y - b / 200;

  final y2 = pow(y, 3);
  final x2 = pow(x, 3);
  final z2 = pow(z, 3);
  y = y2 > 0.008856 ? y2 : (y - 16 / 116) / 7.787;
  x = x2 > 0.008856 ? x2 : (x - 16 / 116) / 7.787;
  z = z2 > 0.008856 ? z2 : (z - 16 / 116) / 7.787;

  x *= 95.047;
  y *= 100;
  z *= 108.883;

  return [x, y, z];
}

List<num> lch(ListBase<num> lab) {
  const PI = 3.141526;

  final l = lab[0];
  final a = lab[1];
  final b = lab[2];
  var h;

  final hr = atan2(b, a);
  h = hr * 360 / 2 / PI;

  if (h < 0) {
    h += 360;
  }

  final c = sqrt(a * a + b * b);

  return [l, c, h];
}
