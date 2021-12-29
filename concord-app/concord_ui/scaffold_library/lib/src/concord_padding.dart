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
  double get left => value;

  double get top => value;

  double get right => value;

  double get bottom => value;

  double get value {
    switch (this) {
      case ConcordPadding.p0:
        return 0;
      case ConcordPadding.p1:
        return 1;
      case ConcordPadding.p2:
        return 2;
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
