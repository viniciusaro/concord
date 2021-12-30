class ConcordPadding {
  final double left;
  final double top;
  final double right;
  final double bottom;

  const ConcordPadding._(this.left, this.top, this.right, this.bottom);

  static const ConcordPadding p0 = ConcordPadding._(0, 0, 0, 0);
  static const ConcordPadding p1 = ConcordPadding._(1, 1, 1, 1);
  static const ConcordPadding p1TopBottom = ConcordPadding._(0, 1, 0, 1);
  static const ConcordPadding p1LeftRight = ConcordPadding._(1, 0, 1, 0);
  static const ConcordPadding p2 = ConcordPadding._(2, 2, 2, 2);
  static const ConcordPadding p2TopBottom = ConcordPadding._(0, 2, 0, 2);
  static const ConcordPadding p2LeftRight = ConcordPadding._(2, 0, 2, 0);

  static ConcordPadding only({
    ConcordPadding left = ConcordPadding.p0,
    ConcordPadding top = ConcordPadding.p0,
    ConcordPadding right = ConcordPadding.p0,
    ConcordPadding bottom = ConcordPadding.p0,
  }) {
    return ConcordPadding._(
      left.left,
      top.top,
      right.right,
      bottom.bottom,
    );
  }

  static ConcordPadding leftRight(
    ConcordPadding leftRight, {
    ConcordPadding topBottom = ConcordPadding.p0,
  }) {
    return ConcordPadding._(
      leftRight.left,
      topBottom.top,
      leftRight.right,
      topBottom.bottom,
    );
  }

  static ConcordPadding topBottom(
    ConcordPadding topBottom, {
    ConcordPadding leftRight = ConcordPadding.p0,
  }) {
    return ConcordPadding._(
      leftRight.left,
      topBottom.top,
      leftRight.right,
      topBottom.bottom,
    );
  }
}
