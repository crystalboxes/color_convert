import 'dart:collection';
import 'dart:math';
import 'color_name.dart';

var reverseKeywords = cssKeywords.map((key, value) => MapEntry(value, key));

int _comparativeDistance(ListBase<num> x, ListBase<num> y) {
  /*
		See https://en.m.wikipedia.org/wiki/Euclidean_distance#Squared_Euclidean_distance
	*/
  return (pow((x[0] - y[0]), 2) + pow((x[1] - y[1]), 2) + pow((x[2] - y[2]), 2))
      .toInt();
}

List<num> hsl(ListBase<num> rgb) {
  final r = rgb[0] / 255;
  final g = rgb[1] / 255;
  final b = rgb[2] / 255;

  final min_ = min(min(r, g), b);
  final max_ = max(max(r, g), b);
  final delta = max_ - min_;
  double h = 0, s = 0;

  if (max_ == min_) {
    h = 0;
  } else if (r == max_) {
    h = (g - b) / delta;
  } else if (g == max_) {
    h = 2 + (b - r) / delta;
  } else if (b == max_) {
    h = 4 + (r - g) / delta;
  }

  h = min(h * 60, 360);

  if (h < 0) {
    h += 360;
  }

  final l = (min_ + max_) / 2;

  if (max_ == min_) {
    s = 0;
  } else if (l <= 0.5) {
    s = delta / (max_ + min_);
  } else {
    s = delta / (2 - max_ - min_);
  }

  return [h, s * 100, l * 100];
}

List<num> hsv(ListBase<num> rgb) {
  double rdif, gdif, bdif, h = 0, s;

  final r = rgb[0] / 255;
  final g = rgb[1] / 255;
  final b = rgb[2] / 255;
  final v = max(max(r, g), b);
  final diff = v - min(min(r, g), b);
  final diffc = (c) {
    return (v - c) / 6 / diff + 1 / 2;
  };

  if (diff == 0) {
    h = 0;
    s = 0;
  } else {
    s = diff / v;
    rdif = diffc(r);
    gdif = diffc(g);
    bdif = diffc(b);

    if (r == v) {
      h = bdif - gdif;
    } else if (g == v) {
      h = (1 / 3) + rdif - bdif;
    } else if (b == v) {
      h = (2 / 3) + gdif - rdif;
    }

    if (h < 0) {
      h += 1;
    } else if (h > 1) {
      h -= 1;
    }
  }

  return [h * 360, s * 100, v * 100];
}

List<num> hwb(List<num> rgb) {
  final r = rgb[0];
  final g = rgb[1];
  var b = rgb[2].toDouble();
  final h = hsl(rgb as ListBase<num>)[0];
  final w = 1 / 255 * min(r, min(g, b));
  b = 1 - 1 / 255 * max(r, max(g, b));
  return [h, w * 100, b * 100];
}

List<num> cmyk(List<num> rgb) {
  final r = rgb[0] / 255.0;
  final g = rgb[1] / 255.0;
  final b = rgb[2] / 255.0;

  final k = min(min(1 - r, 1 - g), 1 - b);
  final c = (1 - r - k) / (1 - k);
  final m = (1 - g - k) / (1 - k);
  final y = (1 - b - k) / (1 - k);

  return [
    c.isNaN ? 0 : c * 100,
    m.isNaN ? 0 : m * 100,
    y.isNaN ? 0 : y * 100,
    k.isNaN ? 0 : k * 100,
  ];
}

String? keyword(ListBase<num> rgb) {
  if (reverseKeywords.containsValue(rgb)) {
    return reverseKeywords[rgb];
  }

  var currentClosestDistance = double.infinity;
  String? currentClosestKeyword;

  for (final keyword in cssKeywords.keys) {
    var value = cssKeywords[keyword]!;

    // Compute comparative distance
    final distance = _comparativeDistance(rgb, value as ListBase<num>);

    // Check if its less, if so set as closest
    if (distance < currentClosestDistance) {
      currentClosestDistance = distance.toDouble();
      currentClosestKeyword = keyword;
    }
  }

  return currentClosestKeyword;
}

List<num> xyz(List<num> rgb) {
  var r = rgb[0] / 255.0;
  var g = rgb[1] / 255.0;
  var b = rgb[2] / 255.0;

  // Assume sRGB
  r = r > 0.04045 ? pow((r + 0.055) / 1.055, 2.4) as double : (r / 12.92);
  g = g > 0.04045 ? pow((g + 0.055) / 1.055, 2.4) as double : (g / 12.92);
  b = b > 0.04045 ? pow((b + 0.055) / 1.055, 2.4) as double : (b / 12.92);

  final x = (r * 0.4124564) + (g * 0.3575761) + (b * 0.1804375);
  final y = (r * 0.2126729) + (g * 0.7151522) + (b * 0.072175);
  final z = (r * 0.0193339) + (g * 0.119192) + (b * 0.9503041);

  return [x * 100, y * 100, z * 100];
}

List<num> lab(List<num> rgb) {
  final xyz_ = xyz(rgb);
  var x = xyz_[0].toDouble();
  var y = xyz_[1].toDouble();
  var z = xyz_[2].toDouble();

  x /= 95.047;
  y /= 100;
  z /= 108.883;

  x = x > 0.008856 ? pow(x, (1 / 3)) as double : (7.787 * x) + (16 / 116);
  y = y > 0.008856 ? pow(y, (1 / 3)) as double : (7.787 * y) + (16 / 116);
  z = z > 0.008856 ? pow(z, (1 / 3)) as double : (7.787 * z) + (16 / 116);

  final l = (116 * y) - 16;
  final a = 500 * (x - y);
  final b = 200 * (y - z);

  return [l, a, b];
}

int ansi16(List<num> rgb, {int? saturation}) {
  final r = rgb[0];
  final g = rgb[1];
  final b = rgb[2];

  var value =
      saturation ?? hsv(rgb as ListBase<num>)[2]; // Hsv -> ansi16 optimization

  value = (value / 50).round();

  if (value == 0) {
    return 30;
  }

  var ansi = 30 +
      (((b / 255).round() << 2) | ((g / 255).round() << 1) | (r / 255).round());

  if (value == 2) {
    ansi += 60;
  }

  return ansi;
}

int ansi256(List<num> rgb) {
  final r = rgb[0].toDouble();
  final g = rgb[1].toDouble();
  final b = rgb[2].toDouble();

  // We use the extended greyscale palette here, with the exception of
  // black and white. normal palette only has 4 greyscale shades.
  if (r == g && g == b) {
    if (r < 8) {
      return 16;
    }

    if (r > 248) {
      return 231;
    }

    return (((r - 8) / 247) * 24).round() + 232;
  }

  final ansi = 16 +
      (36 * (r / 255.0 * 5).round()) +
      (6 * (g / 255.0 * 5).round()) +
      (b / 255.0 * 5).round();

  return ansi;
}

String hex(List<num> hex) {
  final integer = (((hex[0]).round() & 0xFF) << 16) +
      (((hex[1]).round() & 0xFF) << 8) +
      ((hex[2]).round() & 0xFF);

  final string = integer.toRadixString(16).toUpperCase();
  return '000000'.substring(string.length) + string;
}

List<num> hcg(List<num> rgb) {
  final r = rgb[0] / 255;
  final g = rgb[1] / 255;
  final b = rgb[2] / 255;
  final max_ = max(max(r, g), b);
  final min_ = min(min(r, g), b);
  final chroma = (max_ - min_);
  double grayscale, hue;

  if (chroma < 1) {
    grayscale = min_ / (1 - chroma);
  } else {
    grayscale = 0;
  }

  if (chroma <= 0) {
    hue = 0;
  } else if (max_ == r) {
    hue = ((g - b) / chroma) % 6;
  } else if (max_ == g) {
    hue = 2 + (b - r) / chroma;
  } else {
    hue = 4 + (r - g) / chroma;
  }

  hue /= 6;
  hue %= 1;

  return [hue * 360, chroma * 100, grayscale * 100];
}

List<num> apple(List<num> rgb) {
  return [
    (rgb[0] / 255.0) * 65535,
    (rgb[1] / 255.0) * 65535,
    (rgb[2] / 255.0) * 65535
  ];
}

List<num> gray(List<num> rgb) {
  final val = (rgb[0] + rgb[1] + rgb[2]) / 3.0;
  return [(val / 255.0) * 100];
}
