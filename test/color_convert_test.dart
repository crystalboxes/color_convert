import 'package:color_convert/color_convert.dart';
import 'package:color_convert/src/color_name.dart';
import 'package:test/test.dart';

void main() {
  group('Group 1', () {
    test('convert.rgb.hsl', () {
      expect(convert.rgb.hsl([140, 200, 100]), equals([96, 48, 59]));
    });
    test('convert.rgb.hsv', () {
      expect(convert.rgb.hsv([140, 200, 100]), equals([96, 50, 78]));
    });
    test('convert.rgb.hwb', () {
      expect(convert.rgb.hwb([140, 200, 100]), equals([96, 39, 22]));
    });
    test('convert.rgb.cmyk', () {
      expect(convert.rgb.cmyk([140, 200, 100]), equals([30, 0, 50, 22]));
    });
    test('convert.rgb.cmyk', () {
      expect(convert.rgb.cmyk([0, 0, 0, 1]), equals([0, 0, 0, 100]));
    });
    test('convert.rgb.keyword', () {
      expect(convert.rgb.keyword([255, 228, 196]), equals('bisque'));
    });
    test('convert.rgb.xyz', () {
      expect(convert.rgb.xyz([92, 191, 84]), equals([25, 40, 15]));
    });
    test('convert.rgb.lab', () {
      expect(convert.rgb.lab([92, 191, 84]), equals([70, -50, 45]));
    });
    test('convert.rgb.lch', () {
      expect(convert.rgb.lch([92, 191, 84]), equals([70, 67, 138]));
    });
    test('convert.rgb.ansi16', () {
      expect(convert.rgb.ansi16([92, 191, 84]), equals(32));
    });
    test('rgb.ansi256', () {
      expect(convert.rgb.ansi256([92, 191, 84]), equals(114));
    });
    test('convert.rgb.hex', () {
      expect(convert.rgb.hex([92, 191, 84]), '5CBF54');
    });
    test('convert.rgb.hcg', () {
      expect(convert.rgb.hcg([140, 200, 100]), equals([96, 39, 65]));
    });
    test('convert.rgb.apple', () {
      expect(convert.rgb.apple([255, 127, 0]), equals([65535, 32639, 0]));
    });
  });
  group('Group 2', () {
    test('convert.hsl.rgb', () {
      expect(convert.hsl.rgb([96, 48, 59]), [140, 201, 100]);
    });
    test('convert.hsl.hsv', () {
      expect(convert.hsl.hsv([96, 48, 59]), [96, 50, 79]);
    });
    test('convert.hsl.hwb', () {
      expect(convert.hsl.hwb([96, 48, 59]), [96, 39, 21]);
    });
    test('convert.hsl.cmyk', () {
      expect(convert.hsl.cmyk([96, 48, 59]), [30, 0, 50, 21]);
    });
    test('convert.hsl.keyword', () {
      expect(convert.hsl.keyword([240, 100, 50]), equals('blue'));
    });
    test('convert.hsl.ansi16', () {
      expect(convert.hsl.ansi16([240, 100, 50]), 94);
    });
    test('convert.hsl.ansi256', () {
      expect(convert.hsl.ansi256([240, 100, 50]), 21);
    });
    test('convert.hsl.hex', () {
      expect(convert.hsl.hex([240, 100, 50]), equals('0000FF'));
    });
    test('convert.hsl.hcg', () {
      expect(convert.hsl.hcg([96, 48, 59]), [96, 39, 65]);
    });
  });
  group('Group 3', () {
    test('convert.hsv.rgb', () {
      expect(convert.hsv.rgb([96, 50, 78]), [139, 199, 99]);
    });
    test('convert.hsv.hsl', () {
      expect(convert.hsv.hsl([96, 50, 78]), [96, 47, 59]);
    });
    test('convert.hsv.hsl', () {
      expect(convert.hsv.hsl([0, 0, 0]), [0, 0, 0]);
    });
    test('convert.hsv.hwb', () {
      expect(convert.hsv.hwb([96, 50, 78]), [96, 39, 22]);
    });
    test('convert.hsv.cmyk', () {
      expect(convert.hsv.cmyk([96, 50, 78]), [30, 0, 50, 22]);
    });
    test('convert.hsv.keyword', () {
      expect(convert.hsv.keyword([240, 100, 100]), 'blue');
    });
    test('convert.hsv.ansi16', () {
      expect(convert.hsv.ansi16([240, 100, 100]), 94);
    });
    test('convert.hsv.ansi256', () {
      expect(convert.hsv.ansi256([240, 100, 100]), 21);
    });
    test('convert.hsv.hex', () {
      expect(convert.hsv.hex([251, 80, 42]), '25156B');
    });
    test('convert.hsv.hcg', () {
      expect(convert.hsv.hcg([96, 50, 78]), [96, 39, 64]);
    });
  });
  group('Group 4', () {
// https://github.com/Qix-/color-convert/issues/73
    test('convert.rgb.hcg', () {
      expect(convert.rgb.hcg([250, 0, 255]).raw, [298.8235294117647, 100, 0]);
    });

// Non-array arguments
    test('convert.hsl.rgb', () {
      expect(convert.hsl.rgb(96, 48, 59), [140, 201, 100]);
    });
  });
  group('Group 5', () {
    test('convert.cmyk.rgb', () {
      expect(convert.cmyk.rgb([30, 0, 50, 22]), [139, 199, 99]);
    });
    test('convert.cmyk.hsl', () {
      expect(convert.cmyk.hsl([30, 0, 50, 22]), [96, 47, 59]);
    });
    test('convert.cmyk.hsv', () {
      expect(convert.cmyk.hsv([30, 0, 50, 22]), [96, 50, 78]);
    });
    test('convert.cmyk.hwb', () {
      expect(convert.cmyk.hwb([30, 0, 50, 22]), [96, 39, 22]);
    });
    test('convert.cmyk.keyword', () {
      expect(convert.cmyk.keyword([100, 100, 0, 0]), 'blue');
    });
    test('convert.cmyk.ansi16', () {
      expect(convert.cmyk.ansi16([30, 0, 50, 22]), 93);
    });
    test('convert.cmyk.ansi256', () {
      expect(convert.cmyk.ansi256([30, 0, 50, 22]), 150);
    });
    test('convert.cmyk.hex', () {
      expect(convert.cmyk.hex([30, 0, 50, 22]), '8BC763');
    });
  });
  group('Group 6', () {
    test('convert.keyword.rgb', () {
      expect(convert.keyword.rgb('blue'), [0, 0, 255]);
    });
    test('convert.keyword.hsl', () {
      expect(convert.keyword.hsl('blue'), [240, 100, 50]);
    });
    test('convert.keyword.hsv', () {
      expect(convert.keyword.hsv('blue'), [240, 100, 100]);
    });
    test('convert.keyword.hwb', () {
      expect(convert.keyword.hwb('blue'), [240, 0, 0]);
    });
    test('convert.keyword.cmyk', () {
      expect(convert.keyword.cmyk('blue'), [100, 100, 0, 0]);
    });
    test('convert.keyword.lab', () {
      expect(convert.keyword.lab('blue'), [32, 79, -108]);
    });
    test('convert.keyword.xyz', () {
      expect(convert.keyword.xyz('blue'), [18, 7, 95]);
    });
    test('convert.keyword.ansi16', () {
      expect(convert.keyword.ansi16('purple'), 35);
    });
    test('convert.keyword.ansi256', () {
      expect(convert.keyword.ansi256('purple'), 127);
    });
    test('convert.keyword.hex', () {
      expect(convert.keyword.hex('blue'), '0000FF');
    });
  });
  group('Group 7', () {
    test('convert.xyz.rgb', () {
      expect(convert.xyz.rgb([25, 40, 15]), [97, 190, 85]);
    });
    test('convert.xyz.rgb', () {
      expect(convert.xyz.rgb([50, 100, 100]), [0, 255, 241]);
    });
    test('convert.xyz.lab', () {
      expect(convert.xyz.lab([25, 40, 15]), [69, -48, 44]);
    });
    test('convert.xyz.lch', () {
      expect(convert.xyz.lch([25, 40, 15]), [69, 65, 137]);
    });
  });
  group('Group lab', () {
    test('convert.lab.xyz', () {
      expect(convert.lab.xyz([69, -48, 44]), [25, 39, 15]);
    });
    test('convert.lab.rgb', () {
      expect(convert.lab.rgb([75, 20, -30]), [194, 175, 240]);
    });
    test('convert.lab.lch', () {
      expect(convert.lab.lch([69, -48, 44]), [69, 65, 137]);
    });
  });
  group('lch: ', () {
    test('convert.lch.lab', () {
      expect(convert.lch.lab([69, 65, 137]), [69, -48, 44]);
    });
    test('convert.lch.xyz', () {
      expect(convert.lch.xyz([69, 65, 137]), [25, 39, 15]);
    });
    test('convert.lch.rgb', () {
      expect(convert.lch.rgb([69, 65, 137]), [98, 188, 83]);
    });
  });
  group('Group ansi', () {
    test('convert.ansi16.rgb', () {
      expect(convert.ansi16.rgb(103), [255, 255, 0]);
    });
    test('convert.ansi256.rgb', () {
      expect(convert.ansi256.rgb(175), [204, 102, 153]);
    });
  });
  group('Group hex', () {
    test('convert.hex.rgb', () {
      expect(convert.hex.rgb('ABCDEF'), [171, 205, 239]);
    });
    test('convert.hex.rgb', () {
      expect(convert.hex.rgb('AABBCC'), [170, 187, 204]);
    });
    test('convert.hex.rgb', () {
      expect(convert.hex.rgb('ABC'), [170, 187, 204]);
    });
  });

  group('Group hcg', () {
    test('convert.hcg.rgb', () {
      expect(convert.hcg.rgb([96, 39, 64]), [139, 199, 100]);
    });
    test('convert.hcg.hsv', () {
      expect(convert.hcg.hsv([96, 39, 64]), [96, 50, 78]);
    });
    test('convert.hcg.hsl', () {
      expect(convert.hcg.hsl([96, 39, 64]), [96, 47, 59]);
    });
  });

// Raw functions
  List<num> round(List<num> vals) {
    for (var i = 0; i < vals.length; i++) {
      vals[i] = num.parse(vals[i].toStringAsFixed(1));
    }
    return vals;
  }

  group('Group 8', () {
    test('convert.hsl.rgb', () {
      expect(round(convert.hsl.rgb([96, 48, 59]).raw), [140.4, 200.6, 100.3]);
    });
    test('convert.rgb.hsl', () {
      expect(round(convert.rgb.hsl([140, 200, 100]).raw), [96, 47.6, 58.8]);
    });

    test('convert.hsv.rgb', () {
      expect(round(convert.hsv.rgb([96, 50, 78]).raw), [139.2, 198.9, 99.5]);
    });
    test('convert.rgb.hsv', () {
      expect(round(convert.rgb.hsv([140, 200, 100]).raw), [96, 50, 78.4]);
    });

    test('convert.hwb.rgb', () {
      expect(round(convert.hwb.rgb([96, 39, 22]).raw), [139.2, 198.9, 99.5]);
    });
    test('convert.rgb.hwb', () {
      expect(round(convert.rgb.hwb([140, 200, 100]).raw), [96, 39.2, 21.6]);
    });

    test('convert.cmyk.rgb', () {
      expect(
          round(convert.cmyk.rgb([30, 0, 50, 22]).raw), [139.2, 198.9, 99.5]);
    });
    test('convert.rgb.cmyk', () {
      expect(round(convert.rgb.cmyk([140, 200, 100]).raw), [30, 0, 50, 21.6]);
    });

    test('convert.keyword.rgb', () {
      expect(round(convert.keyword.rgb('blue').raw), [0, 0, 255]);
    });
    test('rgb.keyword([', () {
      expect(convert.rgb.keyword([255, 228, 196]), 'bisque');
    });
  });

  group('Group 9', () {
    test('hsv.hsl.raw([96, 50, 78]', () {
      expect(round(convert.hsv.hsl.raw([96, 50, 78])), [96, 47, 58.5]);
    });
    test('hsv.hsl.raw([302, 32, 55]', () {
      expect(round(convert.hsv.hsl.raw([302, 32, 55])), [302, 19.0, 46.2]);
    });
    test('hsv.hsl.raw([267, 19, 89]', () {
      expect(round(convert.hsv.hsl.raw([267, 19, 89])), [267, 43.5, 80.5]);
    });
    test('hsv.hsl.raw([267, 91, 95]', () {
      expect(round(convert.hsv.hsl.raw([267, 91, 95])), [267, 89.6, 51.8]);
    });
    test('hsv.hsl.raw([267, 91, 12]', () {
      expect(round(convert.hsv.hsl.raw([267, 91, 12])), [267, 83.5, 6.5]);
    });
    test('hsv.hsl.raw([180, 50, 0]', () {
      expect(round(convert.hsv.hsl.raw([180, 50, 0])), [180, 33.3, 0]);
    });
  });

  group('Group 10', () {
    test('hsl.hsv.raw([96, 48, 59]', () {
      expect(round(convert.hsl.hsv.raw([96, 48, 59])), [96, 50, 78.7]);
    });
    test('hsl.hsv.raw([120, 54, 61]', () {
      expect(round(convert.hsl.hsv.raw([120, 54, 61])), [120, 51.3, 82.1]);
    });
    test('hsl.hsv.raw([27, 51, 43]', () {
      expect(round(convert.hsl.hsv.raw([27, 51, 43])), [27, 67.5, 64.9]);
    });
    test('hsl.hsv.raw([241, 17, 79]', () {
      expect(round(convert.hsl.hsv.raw([241, 17, 79])), [241, 8.6, 82.6]);
    });
    test('hsl.hsv.raw([120, 50, 0]', () {
      expect(round(convert.hsl.hsv.raw([120, 50, 0])), [120, 66.7, 0]);
    });
  });

  group('Group 11', () {
    test('convert.xyz.rgb.raw([25, 40, 15]))', () {
      expect(round(convert.xyz.rgb.raw([25, 40, 15])), [97.4, 189.9, 85]);
    });

    test('rgb.xyz.raw([92, 191, 84]', () {
      expect(round(convert.rgb.xyz.raw([92, 191, 84])), [24.6, 40.2, 14.8]);
    });

    test('rgb.lab.raw([92, 191, 84]', () {
      expect(round(convert.rgb.lab.raw([92, 191, 84])), [69.6, -50.1, 44.6]);
    });
  });

// Hwb
// http://dev.w3.org/csswg/css-color/#hwb-examples

// all extreme value should give black, white or grey
  group('HWB extreme values test', () {
    for (var angle = 0; angle <= 360; angle++) {
      test('angle: [$angle] hwb.rgb([angle, 0, 100]', () {
        expect(convert.hwb.rgb([angle, 0, 100]), [0, 0, 0]);
        expect(convert.hwb.rgb([angle, 100, 0]), [255, 255, 255]);
        expect(convert.hwb.rgb([angle, 100, 100]), [128, 128, 128]);
      });
    }
  });

  group('HWB', () {
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([0, 0, 0]), [255, 0, 0]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([0, 20, 40]), [153, 51, 51]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([0, 40, 40]), [153, 102, 102]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([0, 40, 20]), [204, 102, 102]);
    });

    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([120, 0, 0]), [0, 255, 0]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([120, 20, 40]), [51, 153, 51]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([120, 40, 40]), [102, 153, 102]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([120, 40, 20]), [102, 204, 102]);
    });

    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([240, 0, 0]), [0, 0, 255]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([240, 20, 40]), [51, 51, 153]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([240, 40, 40]), [102, 102, 153]);
    });
    test('convert.hwb.rgb', () {
      expect(convert.hwb.rgb([240, 40, 20]), [102, 102, 204]);
    });
  });

  group('Black should always stay black', () {
    const val = [0, 0, 0];
    test('convert.hsl.hsv', () {
      expect(convert.hsl.hsv(val), val);
    });
    test('convert.hsl.rgb', () {
      expect(convert.hsl.rgb(val), val);
    });
    test('convert.hsl.hwb', () {
      expect(convert.hsl.hwb(val), [0, 0, 100]);
    });
    test('convert.hsl.cmyk', () {
      expect(convert.hsl.cmyk(val), [0, 0, 0, 100]);
    });
    test('convert.hsl.hex', () {
      expect(convert.hsl.hex(val), '000000');
    });
  });

  group('Test keyword rounding', () {
    test('convert.rgb.keyword', () {
      expect(convert.rgb.keyword(255, 255, 0), 'yellow');
      expect(convert.rgb.keyword(255, 255, 1), 'yellow');
      expect(convert.rgb.keyword(250, 254, 1), 'yellow');
    });
  });

// Assure euclidean distance algorithm produces perfectly inverse results
  group('Assure euclidean distance algorithm', () {
    final keywordKeys = cssKeywords.keys;
    test('keyword', () {
      for (final k in keywordKeys) {
        // Why the roundabout testing method? certain css keywords have the same color values.
        final derived = convert.rgb.keyword(cssKeywords[k]);
        expect(cssKeywords[derived], cssKeywords[k]);
      }
    });
  });

// Basic gray tests
  group('Basic gray tests', () {
    test('convert.gray.rgb([0]), [0, 0, 0]);', () {
      expect(convert.gray.rgb([0]), [0, 0, 0]);
    });
    test('convert.gray.rgb([50]), [128, 128, 128]);', () {
      expect(convert.gray.rgb([50]), [128, 128, 128]);
    });
    test('convert.gray.rgb([100]), [255, 255, 255]);', () {
      expect(convert.gray.rgb([100]), [255, 255, 255]);
    });
    test('convert.gray.hsl([50]), [0, 0, 50]);', () {
      expect(convert.gray.hsl([50]), [0, 0, 50]);
    });
    test('convert.gray.hsv([50]), [0, 0, 50]);', () {
      expect(convert.gray.hsv([50]), [0, 0, 50]);
    });
    test('convert.gray.hwb([50]), [0, 100, 50]);', () {
      expect(convert.gray.hwb([50]), [0, 100, 50]);
    });
    test('convert.gray.cmyk([50]), [0, 0, 0, 50]);', () {
      expect(convert.gray.cmyk([50]), [0, 0, 0, 50]);
    });
    test('convert.gray.lab([50]), [50, 0, 0]);', () {
      expect(convert.gray.lab([50]), [50, 0, 0]);
    });
    test('convert.gray.hex([50]), 808080);', () {
      expect(convert.gray.hex([50]), '808080');
    });
    test('convert.gray.hex([100]), FFFFFF);', () {
      expect(convert.gray.hex([100]), 'FFFFFF');
    });
    test('convert.gray.hex([0]), 000000);', () {
      expect(convert.gray.hex([0]), '000000');
    });

    test('convert.rgb.gray([0, 0, 0]), [0]);', () {
      expect(convert.rgb.gray([0, 0, 0]), [0]);
    });
    test('convert.rgb.gray([128, 128, 128]), [50]);', () {
      expect(convert.rgb.gray([128, 128, 128]), [50]);
    });
    test('convert.rgb.gray([255, 255, 255]):', () {
      expect(convert.rgb.gray([255, 255, 255]), [100]);
    });
    test('convert.rgb.gray([0, 128, 255]):', () {
      expect(convert.rgb.gray([0, 128, 255]), [50]);
    });
  });
}
