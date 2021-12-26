enum ConcordPadding {
  p0,
  p1,
  p2,
}

enum ConcordEdges {
  all,
  leftRight,
  topBottom,
}

extension ConcordPaddingX on ConcordPadding {
  double get left => _value;

  double get top => _value;

  double get right => _value;

  double get bottom => _value;

  double get _value {
    switch (this) {
      case ConcordPadding.p0:
        return 1;
      case ConcordPadding.p1:
        return 2;
      case ConcordPadding.p2:
        return 3;
    }
  }
}

extension ConcordEdgesX on ConcordEdges {
  double get leftDiscount {
    switch (this) {
      case ConcordEdges.all:
        return 1;
      case ConcordEdges.topBottom:
        return 0;
      case ConcordEdges.leftRight:
        return 1;
    }
  }

  double get topDiscount {
    switch (this) {
      case ConcordEdges.all:
        return 1;
      case ConcordEdges.topBottom:
        return 1;
      case ConcordEdges.leftRight:
        return 0;
    }
  }

  double get rightDiscount {
    switch (this) {
      case ConcordEdges.all:
        return 1;
      case ConcordEdges.topBottom:
        return 0;
      case ConcordEdges.leftRight:
        return 1;
    }
  }

  double get bottomDiscount {
    switch (this) {
      case ConcordEdges.all:
        return 1;
      case ConcordEdges.topBottom:
        return 1;
      case ConcordEdges.leftRight:
        return 0;
    }
  }
}
