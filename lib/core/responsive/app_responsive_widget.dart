import 'package:flutter/material.dart';

import 'screen_meta.dart';

class AppResponsiveBuilder extends StatelessWidget {
  const AppResponsiveBuilder({Key key, @required this.builder})
      : super(key: key);

  final Function(BuildContext context, ScreenMeta screenMeta) builder;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final screenMeta = ScreenMeta(
          deviceScreenType: getDeviceType(mq),
          screenSize: mq.size,
          localWidget: Size(constraints.maxWidth, constraints.maxHeight));
      return builder(context, screenMeta);
    });
  }
}
