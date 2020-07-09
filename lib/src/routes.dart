import 'dart:collection';

import 'color_name.dart';
import 'misc_color_spaces.dart';
import 'rgb.dart' as rgb;
import 'hsl.dart' as hsl;
import 'hsv.dart' as hsv;
import 'hwb.dart' as hwb;
import 'xyz.dart' as xyz;
import 'lab.dart' as lab;
import 'gray.dart' as gray;
import 'hcg.dart' as hcg;

const colorSpaceNames = [
  'rgb',
  'hsl',
  'hsv',
  'hwb',
  'xyz',
  'lab',
  'lch',
  'hex',
  'hcg',
  'ansi16',
  'ansi256',
  'cmyk',
  'keyword',
  'apple',
  'gray',
];

// NOTE: conversions should only return primitive values (i.e. arrays, or
//       values that give correct `typeof` results).
//       do not use box values types (i.e. Number(), String(), etc.)
// const reverseKeywords = cssKeywords;

Map<String, Map<String, dynamic>> conversionRoutes = {
  'rgb': {
    'hsl': rgb.hsl,
    'hsv': rgb.hsv,
    'hwb': rgb.hwb,
    'cmyk': rgb.cmyk,
    'keyword': rgb.keyword,
    'xyz': rgb.xyz,
    'lab': rgb.lab,
    'lch': (x) => lab.lch(rgb.lab(x)),
    'ansi16': rgb.ansi16,
    'ansi256': rgb.ansi256,
    'hex': rgb.hex,
    'hcg': rgb.hcg,
    'apple': rgb.apple,
    'gray': rgb.gray,
  },
  'hsl': {
    'rgb': hsl.rgb,
    'hsv': hsl.hsv,
    'hcg': hsl.hcg,
  },
  'hsv': {
    'rgb': hsv.rgb,
    'hsl': hsv.hsl,
    'ansi16': (x) => rgb.ansi16(hsv.rgb(x)),
    'hcg': hsv.hcg,
  },
  'hwb': {
    'rgb': hwb.rgb,
    'hcg': hwb.hcg,
  },
  'hcg': {
    'rgb': hcg.rgb,
    'hsv': hcg.hsv,
    'hsl': hcg.hsl,
    'hwb': hcg.hwb,
  },
  'xyz': {
    'rgb': xyz.rgb,
    'lab': xyz.lab,
    'lch': (x) => lab.lch(xyz.lab(x)),
  },
  'lab': {
    'xyz': lab.xyz,
    'lch': lab.lch,
  },
  'lch': {
    'lab': lch2lab,
  },
  'hex': {
    'rgb': hex2rgb,
  },
  'keyword': {
    'rgb': (String keyword) {
      return cssKeywords[keyword];
    },
  },
  'ansi16': {
    'rgb': ansi162rgb,
  },
  'ansi256': {
    'rgb': ansi2562rgb,
  },
  'cmyk': {
    'rgb': cmyk2rgb,
  },
  'apple': {
    'rgb': (ListBase<num> apple) => [
          (apple[0] / 65535) * 255,
          (apple[1] / 65535) * 255,
          (apple[2] / 65535) * 255
        ],
  },
  'gray': {
    'rgb': gray.rgb,
    'hsl': gray.hsl,
    'hsv': gray.hsv,
    'hwb': gray.hwb,
    'cmyk': gray.cmyk,
    'lab': gray.lab,
    'hex': gray.hex,
  }
};
