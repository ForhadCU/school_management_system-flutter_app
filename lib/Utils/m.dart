import 'package:flutter/material.dart';

class M {
  final BoxConstraints constraints;
  M(this.constraints);

  /* 
  Common mobile screen resolutions include: 
  480×800, 640×1136, 720×1280, 750×1334, 1080×1920, and 1440×2560. 
  The most common resolution is 720x1280. */

  bool get xs => constraints.maxWidth <= 360; //android
  bool get sm => constraints.maxWidth <= 375; // ios
  bool get md => constraints.maxWidth <= 411; //current
  bool get lg => constraints.maxWidth <= 768;
  bool get xl => constraints.maxWidth <= 1080;
  bool get xxl => constraints.maxWidth <= 1440;

  bool get small => constraints.maxWidth <= 400;

  /// For Web
  /*   bool get xs => constraints.maxWidth < 556;
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
  bool get xxlUp => constraints.maxWidth >=1400; */
}
