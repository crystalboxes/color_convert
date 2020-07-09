import 'dart:collection';
import 'dart:core';
import 'dart:math';
import 'package:color_convert/src/rgb.dart' as rgb_conv;

List<num> rgb(ListBase<num> hsv) {
  final h = hsv[0] / 60;
  final s = hsv[1] / 100;
  var v = hsv[2] / 100;
  final hi = h.floor() % 6;

  final f = h - h.floor();
  final p = 255 * v * (1 - s);
  final q = 255 * v * (1 - (s * f));
  final t = 255 * v * (1 - (s * (1 - f)));
  v *= 255;

  switch (hi) {
    case 0:
      return [v, t, p];
    case 1:
      return [q, v, p];
    case 2:
      return [p, v, t];
    case 3:
      return [p, q, v];
    case 4:
      return [t, p, v];
    case 5:
      return [v, p, q];
  }
  return [v, t, p];
}

List<num> hsl(ListBase<num> hsv) {
  final h = hsv[0];
  final s = hsv[1] / 100;
  final v = hsv[2] / 100;
  final vmin = max(v, 0.01);
  double sl, l;

  l = (2 - s) * v;
  final lmin = (2 - s) * vmin;
  sl = s * vmin;
  sl /= (lmin <= 1) ? lmin : 2 - lmin;
  sl = sl.isNaN ? 0 : sl;
  l /= 2;

  return [h, sl * 100, l * 100];
}

int ansi16(ListBase<num> hsv) =>
    rgb_conv.ansi16(hsv, saturation: hsv[1].round());

List<num> hcg(ListBase<num> hsv) {
  final s = hsv[1] / 100;
  final v = hsv[2] / 100;

  final c = s * v;
  var f = 0.0;

  if (c < 1.0) {
    f = (v - c) / (1 - c);
  }
  return [hsv[0].toDouble(), c * 100, f * 100];
}
