import 'package:color_convert/color_convert.dart';

void main() {
  convert.rgb.hsl(140, 200, 100); // [96, 48, 59]
  convert.keyword.rgb('blue'); // [0, 0, 255]

  var rgbChannels = convert.rgb.channels; // 3
  var cmykChannels = convert.cmyk.channels; // 4
  var ansiChannels = convert.ansi16.channels; // 1
}
