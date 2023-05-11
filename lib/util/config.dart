import 'package:flutter/material.dart';

class Config {
  static String accessToken =
      'sk.eyJ1IjoiY3lieTEwMDIiLCJhIjoiY2xoMjRxenRsMWFrcTNkcnphZW1oaHpuYiJ9.1s7I24EFzusU3R1r1CoMpw';

  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;

  }
}
