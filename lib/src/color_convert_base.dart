import 'dart:collection';
import 'dart:core';

import 'routes.dart';

List<String?> _getRoute(List<String?> path, String current, String? to) {
  for (final kv in conversionRoutes[current]!.entries) {
    final key = kv.key;
    if (path.contains(key)) {
      continue;
    }
    if (path.isNotEmpty && current != path.last) {
      path.add(current);
    }
    path.add(key);
    if (conversionRoutes[key]!.containsKey(to)) {
      path.add(to);
      return path;
    } else {
      var newPath = _getRoute([...path], key, to);
      if (newPath.last == to) {
        return newPath;
      }
    }
  }
  return path;
}

dynamic _convert(String from, String? to, dynamic value) {
  dynamic result;

  if (conversionRoutes[from]!.containsKey(to)) {
    result = (conversionRoutes[from]![to!](value));
  } else {
    var path = _getRoute([], from, to);
    String? currentFrom = from;
    result = value;
    for (var currentTo in path) {
      result = conversionRoutes[currentFrom!]![currentTo!](result);
      currentFrom = currentTo;
    }
  }

  if (result is List) {
    return _ConversionResult(result as List<num>);
  }
  return result;
}

bool _isValidColorSpace(String? name) => colorSpaceNames.contains(name);

class _ConversionResult extends Object with ListMixin<int> {
  final List<num> _list = [];
  _ConversionResult(List<num> l) {
    l.forEach((element) {
      _list.add(element);
    });
  }

  @override
  set length(int newLength) {
    _list.length = newLength;
  }

  @override
  int get length => _list.length;

  @override
  int operator [](int index) => _list[index].round();

  @override
  void operator []=(int index, num value) {
    _list[index] = value;
  }

  List<double> get raw => _list.map((e) => e.toDouble()).toList();
}

const _colorChannels = {
  'rgb': 3,
  'hsl': 3,
  'hsv': 3,
  'hwb': 3,
  'cmyk': 4,
  'xyz': 3,
  'lab': 3,
  'lch': 3,
  'hex': 1,
  'keyword': 1,
  'ansi16': 1,
  'ansi256': 1,
  'hcg': 3,
  'apple': 3,
  'gray': 1,
};

const _colorLabels = {
  'rgb': 'rgb',
  'hsl': 'hsl',
  'hsv': 'hsv',
  'hwb': 'hwb',
  'cmyk': 'cmyk',
  'xyz': 'xyz',
  'lab': 'lab',
  'lch': 'lch',
  'hex': ['hex'],
  'keyword': ['keyword'],
  'ansi16': ['ansi16'],
  'ansi256': ['ansi256'],
  'hcg': ['h', 'c', 'g'],
  'apple': ['r16', 'g16', 'b16'],
  'gray': ['gray'],
};

const symbolToString = {
  Symbol('rgb'): 'rgb',
  Symbol('hsl'): 'hsl',
  Symbol('hsv'): 'hsv',
  Symbol('hwb'): 'hwb',
  Symbol('cmyk'): 'cmyk',
  Symbol('xyz'): 'xyz',
  Symbol('lab'): 'lab',
  Symbol('lch'): 'lch',
  Symbol('hex'): 'hex',
  Symbol('keyword'): 'keyword',
  Symbol('ansi16'): 'ansi16',
  Symbol('ansi256'): 'ansi256',
  Symbol('hcg'): 'hcg',
  Symbol('apple'): 'apple',
  Symbol('gray'): 'gray',
  // utility
  Symbol('raw'): 'raw',
  Symbol('labels'): 'labels',
  Symbol('channels'): 'channels',
};

String? getMemberName(Symbol symbol) {
  return symbolToString[symbol];
}

class _ConvertRouteReceiver {
  String from = '';
  String? to = '';

  @override
  dynamic noSuchMethod(Invocation msg) {
    // from
    var memberName = getMemberName(msg.memberName);
    if (from != '') {
      if (memberName == 'channels') {
        return _colorChannels[from];
      } else if (memberName == 'labels') {
        return _colorLabels[from];
      }
    }
    var isRaw = memberName == 'raw';
    final to_ = to == '' ? memberName : to;
    if (msg.positionalArguments.isEmpty) {
      to = to_;
      return this;
    }
    var arg = msg.positionalArguments[0];
    if (msg.positionalArguments.length > 1) {
      arg = msg.positionalArguments
          .map((e) => e is num ? e.toDouble() : 0)
          .toList();
    }
    if (_isValidColorSpace(from) && _isValidColorSpace(to_)) {
      var result = _convert(from, to_, arg);
      if (isRaw) {
        to = '';
        if (result is _ConversionResult) return result.raw;
      }
      return result;
    }
    return null;
  }
}

class _Convert {
  final route = _ConvertRouteReceiver() as dynamic;
  @override
  _ConvertRouteReceiver noSuchMethod(Invocation msg) {
    route.from = getMemberName(msg.memberName);
    return route;
  }
}

dynamic convert = _Convert();
