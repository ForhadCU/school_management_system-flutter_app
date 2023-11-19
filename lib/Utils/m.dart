import 'package:flutter/material.dart';

class M {
  final BoxConstraints constraints;
  M(this.constraints);

  bool get xs => constraints.maxWidth < 556;
  bool get sm => constraints.maxWidth <=556;
  bool get md => constraints.maxWidth <=768;
  bool get lg => constraints.maxWidth <=992;
  bool get xl => constraints.maxWidth <=1200;
  bool get xxl => constraints.maxWidth <=1400;
  ///  up
  bool get smUp => constraints.maxWidth >=556;
  bool get mdUp => constraints.maxWidth >=768;
  bool get lgUp => constraints.maxWidth >=992;
  bool get xlUp => constraints.maxWidth >=1200;
  bool get xxlUp => constraints.maxWidth >=1400;
}
