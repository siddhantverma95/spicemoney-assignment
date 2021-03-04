import 'package:flutter/material.dart';

enum DeviceScreenType { Desktop, Tablet, Mobile }

class ScreenMeta {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidget;

  ScreenMeta(
      {@required this.deviceScreenType,
      @required this.screenSize,
      this.localWidget});
}

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 700) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
