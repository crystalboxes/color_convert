import 'dart:collection';
import 'dart:math';

List<num> rgb(ListBase<num> hsl) {
  final h = hsl[0] / 360;
  final s = hsl[1] / 100;
  final l = hsl[2] / 100;
  double t2, t3, val;

  if (s == 0) {
    val = l * 255;
    return [val, val, val];
  }

  if (l < 0.5) {
    t2 = l * (1 + s);
  } else {
    t2 = l + s - l * s;
  }

  final t1 = 2 * l - t2;

  final rgb = <num>[0, 0, 0];
  for (var i = 0; i < 3; i++) {
    t3 = h + 1 / 3 * -(i - 1);
    if (t3 < 0) {
      t3++;
    }

    if (t3 > 1) {
      t3--;
    }

    if (6 * t3 < 1) {
      val = t1 + (t2 - t1) * 6 * t3;
    } else if (2 * t3 < 1) {
      val = t2;
    } else if (3 * t3 < 2) {
      val = t1 + (t2 - t1) * (2 / 3 - t3) * 6;
    } else {
      val = t1;
    }

    rgb[i] = val * 255;
  }

  return rgb;
}

List<num> hsv(ListBase<num> hsl) {
  final h = hsl[0];
  var s = hsl[1] / 100;
  var l = hsl[2] / 100;
  var smin = s;
  final lmin = max(l, 0.01);

  l *= 2;
  s *= (l <= 1) ? l : 2 - l;
  smin *= lmin <= 1 ? lmin : 2 - lmin;
  final v = (l + s) / 2;
  final sv = l == 0 ? (2 * smin) / (lmin + smin) : (2 * s) / (l + s);

  return [h, sv * 100, v * 100];
}

List<num> hcg(ListBase<num> hsl) {
  final s = hsl[1] / 100.0;
  final l = hsl[2] / 100.0;

  final c = l < 0.5 ? (2.0 * s * l) : (2.0 * s * (1.0 - l));

  var f = 0.0;
  if (c < 1.0) {
    f = (l - 0.5 * c) / (1.0 - c);
  }

  return [hsl[0].toDouble(), c * 100, f * 100];
}
