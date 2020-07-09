import 'dart:collection';

List<num> hcg(ListBase<num> hwb) {
  final w = hwb[1] / 100;
  final b = hwb[2] / 100;
  final v = 1 - b;
  final c = v - w;
  var g = 0.0;

  if (c < 1) {
    g = (v - c) / (1 - c);
  }

  return [hwb[0].toDouble(), c * 100, g * 100];
}

List<num> rgb(ListBase<num> hwb) {
  final h = hwb[0] / 360;
  var wh = hwb[1] / 100;
  var bl = hwb[2] / 100;
  final ratio = wh + bl;
  double f;

  // Wh + bl cant be > 1
  if (ratio > 1) {
    wh /= ratio;
    bl /= ratio;
  }

  final i = (6 * h).floor();
  final v = 1 - bl;
  f = 6 * h - i;

  if ((i & 0x01) != 0) {
    f = 1 - f;
  }

  final n = wh + f * (v - wh); // Linear interpolation

  double r, g, b;

  if (i == 6 || i == 0) {
    r = v;
    g = n;
    b = wh;
  } else if (i == 1) {
    r = n;
    g = v;
    b = wh;
  } else if (i == 2) {
    r = wh;
    g = v;
    b = n;
  } else if (i == 3) {
    r = wh;
    g = n;
    b = v;
  } else if (i == 4) {
    r = n;
    g = wh;
    b = v;
  } else if (i == 5) {
    r = v;
    g = wh;
    b = n;
  }
  return [r * 255, g * 255, b * 255];
}
