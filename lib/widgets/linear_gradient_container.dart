import 'package:flutter/material.dart';
import 'package:random_color_app/utils/color_generator.dart';

///Widget that shows linear gradient with 2 colors on background
class LinearGradientContainer extends StatefulWidget {
  ///Default const constructor
  const LinearGradientContainer({super.key});

  @override
  State<LinearGradientContainer> createState() => _LinearGradientContainerState(
  );
}

class _LinearGradientContainerState extends State<LinearGradientContainer> {
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
          gradient: LinearGradient(colors: [_startColor, _endColor],
          begin: Alignment.topLeft,
          end : Alignment.bottomRight,),
        ),
        alignment: Alignment.center,
        child: const Text('Hello there'),
      ),
    );
  }
}
