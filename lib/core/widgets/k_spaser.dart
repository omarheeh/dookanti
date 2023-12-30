import 'package:dookanti/core/functions/size_config.dart';
import 'package:flutter/material.dart';

class HSpaser extends StatelessWidget {
  const HSpaser(this.size);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize * size,
    );
  }
}

class VSpaser extends StatelessWidget {
  const VSpaser(this.size);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize * size,
    );
  }
}
