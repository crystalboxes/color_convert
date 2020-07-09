# color_convert

A color conversion library for Dart.
It converts all ways between `rgb`, `hsl`, `hsv`, `hwb`, `cmyk`, `ansi`, `ansi16`, `hex` strings, and CSS `keyword`s (will round to closest).
Based on [color-convert](https://github.com/Qix-/color-convert) by Heather Arthur.

## Usage

```dart
import 'package:color_convert/color_convert.dart';

void main() {
  convert.rgb.hsl(140, 200, 100); // [96, 48, 59]
  convert.keyword.rgb('blue'); // [0, 0, 255]

  var rgbChannels = convert.rgb.channels; // 3
  var cmykChannels = convert.cmyk.channels; // 4
  var ansiChannels = convert.ansi16.channels; // 1
}
```

# API

Simply get the property of the _from_ and _to_ conversion that you're looking for.

All functions have a rounded and unrounded variant. By default, return values are rounded. To get the unrounded (raw) results, simply tack on `.raw` to the function.

All 'from' functions have a hidden property called `.channels` that indicates the number of channels the function expects (not including alpha).

```dart
import 'package:color_convert/color_convert.dart';

void main() {
  // Hex to LAB
  convert.hex.lab('DEADBF');         // [ 76, 21, -2 ]
  convert.hex.lab.raw('DEADBF');     // [ 75.56213190997677, 20.653827952644754, -2.290532499330533 ]

  // RGB to CMYK
  convert.rgb.cmyk(167, 255, 4);     // [ 35, 0, 98, 0 ]
  convert.rgb.cmyk.raw(167, 255, 4); // [ 34.509803921568626, 0, 98.43137254901961, 0 ]
}
```

### Arrays
All functions that accept multiple arguments also support passing an array.

Note that this does **not** apply to functions that convert from a color that only requires one value (e.g. `keyword`, `ansi256`, `hex`, etc.)

```dart
import 'package:color_convert/color_convert.dart';

void main() {
  convert.rgb.hex(123, 45, 67);      // '7B2D43'
  convert.rgb.hex([123, 45, 67]);    // '7B2D43'
}
```

## Color Space Scales
Conversions rely on an agreed upon 'full-scale' value for each of the channels. Listed here are those values for the most common color spaces

### rgb
channel | full-scale value
---|---
r | 255
g | 255
b | 255

### hsl
channel | full-scale value
---|---
h | 360
s | 100
l | 100

### hsv
channel | full-scale value
---|---
h | 360
s | 100
v | 100

### hwb
channel | full-scale value
---|---
h | 360
w | 100
b | 100

### cmyk
channel | full-scale value
---|---
c | 100
m | 100
y | 100
k | 100

### hex
channel | full-scale value
---|---
hex | ```0xffffff```

### keyword
channel | value
---|---
name | any key from [color-name](https://github.com/colorjs/color-name/blob/master/index.js)

### apple
channel | full-scale value
---|---
0 | 65535
1 | 65535
2 | 65535

### gray
channel | full-scale value
---|---
g | 100

# License
[MIT License](LICENSE).