import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get scale => MediaQuery.of(this).devicePixelRatio;
  double get textScale => MediaQuery.of(this).textScaleFactor;
  double get safeTop => MediaQuery.of(this).padding.top;
  double get safeBottom => MediaQuery.of(this).padding.bottom;
  double get safeLeft => MediaQuery.of(this).padding.left;
  double get safeRight => MediaQuery.of(this).padding.right;
  double get safeWidth => width - safeLeft - safeRight;
  double get safeHeight => height - safeTop - safeBottom;
  double get safeScale => scale * textScale;
}