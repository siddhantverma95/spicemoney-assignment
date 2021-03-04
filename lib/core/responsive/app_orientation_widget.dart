import 'package:flutter/material.dart';

class AppOrientationBuilder extends StatelessWidget {
  const AppOrientationBuilder(
      {Key key, @required this.portrait, this.landscape})
      : super(key: key);
  final Function(BuildContext context) portrait;
  final Function(BuildContext context) landscape;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape)
      return landscape(context) ?? portrait(context);

    return portrait(context);
  }
}
