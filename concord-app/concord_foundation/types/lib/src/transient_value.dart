import 'package:flutter/foundation.dart';

class TransientValue<T> {
  final T _content;
  bool _hasBeenHandled = false;

  TransientValue(this._content);

  T? get value => _hasBeenHandled ? null : _getContent();

  T _getContent() {
    _hasBeenHandled = true;
    return _content;
  }

  @override
  operator ==(Object other) {
    if (_content is List) {
      return other is TransientValue<T> &&
          listEquals(other._content as List, _content as List) &&
          other._hasBeenHandled == _hasBeenHandled;
    } else {
      return other is TransientValue<T> &&
          other._content == _content &&
          other._hasBeenHandled == _hasBeenHandled;
    }
  }

  @override
  int get hashCode {
    return _content.hashCode ^ _hasBeenHandled.hashCode ^ 31;
  }

  @override
  String toString() =>
      'TransientValue(_content: $_content, _hasBeenHandled: $_hasBeenHandled)';
}
