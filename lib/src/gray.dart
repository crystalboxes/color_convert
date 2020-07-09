import 'dart:collection';

List<num> rgb(ListBase<num> args) {
  return [args[0] / 100 * 255, args[0] / 100 * 255, args[0] / 100 * 255];
}

List<num> hsl(ListBase<num> args) {
  return [0, 0, args[0]];
}

const hsv = hsl;

List<num> hwb(ListBase<num> gray) {
  return [0, 100, gray[0]];
}

List<num> cmyk(ListBase<num> gray) {
  return [0, 0, 0, gray[0]];
}

List<num> lab(ListBase<num> gray) {
  return [gray[0], 0, 0];
}

String hex(ListBase<num> gray) {
  final val = (gray[0] / 100 * 255).round() & 0xFF;
  final integer = (val << 16) + (val << 8) + val;

  final string = integer.toRadixString(16).toUpperCase();
  return '000000'.substring(string.length) + string;
}
