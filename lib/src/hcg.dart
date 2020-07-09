import 'dart:collection';

List<num> rgb(ListBase<num> hcg) {
  final h = hcg[0] / 360;
  final c = hcg[1] / 100;
  final g = hcg[2] / 100;

  if (c == 0.0) {
    return [g * 255, g * 255, g * 255];
  }

  final pure = [0.0, 0.0, 0.0];
  final hi = (h % 1) * 6;
  final v = hi % 1;
  final w = 1 - v;
  var mg = 0.0;

  switch ((hi).floor()) {
    case 0:
      pure[0] = 1;
      pure[1] = v;
      pure[2] = 0;
      break;
    case 1:
      pure[0] = w;
      pure[1] = 1;
      pure[2] = 0;
      break;
    case 2:
      pure[0] = 0;
      pure[1] = 1;
      pure[2] = v;
      break;
    case 3:
      pure[0] = 0;
      pure[1] = w;
      pure[2] = 1;
      break;
    case 4:
      pure[0] = v;
      pure[1] = 0;
      pure[2] = 1;
      break;
    default:
      pure[0] = 1;
      pure[1] = 0;
      pure[2] = w;
  }

  mg = (1.0 - c) * g;

  return [
    (c * pure[0] + mg) * 255,
    (c * pure[1] + mg) * 255,
    (c * pure[2] + mg) * 255
  ];
}

List<num> hsv(ListBase<num> hcg) {
  final c = hcg[1] / 100;
  final g = hcg[2] / 100;

  final v = c + g * (1.0 - c);
  var f = 0.0;

  if (v > 0.0) {
    f = c / v;
  }

  return [hcg[0], f * 100, v * 100];
}

List<num> hsl(ListBase<num> hcg) {
  final c = hcg[1] / 100;
  final g = hcg[2] / 100;

  final l = g * (1.0 - c) + 0.5 * c;
  var s = 0.0;

  if (l > 0.0 && l < 0.5) {
    s = c / (2 * l);
  } else if (l >= 0.5 && l < 1.0) {
    s = c / (2 * (1 - l));
  }

  return [hcg[0], s * 100, l * 100];
}

List<num> hwb(ListBase<num> hcg) {
  final c = hcg[1] / 100;
  final g = hcg[2] / 100;
  final v = c + g * (1.0 - c);
  return [hcg[0], (v - c) * 100, (1 - v) * 100];
}
