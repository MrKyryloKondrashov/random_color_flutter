import 'package:flutter/material.dart';
import 'package:random_color_app/utils/color_generator.dart';

///Widget that shows radiant gradient with 2 colors on background
class RadialGradientContainer extends StatefulWidget {
  ///Default const constrictor
  const RadialGradientContainer({super.key});

  @override
  State<RadialGradientContainer> createState() =>
      _RadialGradientContainerState();
}

class _RadialGradientContainerState extends State<RadialGradientContainer> {
  Color _startColor = getRandomColor();
  Color _endColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _startColor = getRandomColor();
          _endColor = getRandomColor();
        });
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [_startColor, _endColor],
        ),),
        alignment: Alignment.center,
        child: const Text('Hello there'),
      ),
    );
  }
}
