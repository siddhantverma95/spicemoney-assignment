import 'package:flutter/material.dart';

import 'app_responsive_widget.dart';
import 'screen_meta.dart';

class AppResponsiveLayout extends StatelessWidget {
  const AppResponsiveLayout({Key key, this.desktop, this.tablet, this.mobile})
      : super(key: key);
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return AppResponsiveBuilder(builder: (context, screenMeta) {
      if (screenMeta.deviceScreenType == DeviceScreenType.Tablet) if (tablet !=
          null) return tablet;
      if (screenMeta.deviceScreenType ==
          DeviceScreenType.Desktop) if (desktop != null) return desktop;
      return mobile;
    });
  }
}
