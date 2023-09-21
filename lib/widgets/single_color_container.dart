import 'package:flutter/material.dart';
import 'package:random_color_app/utils/color_generator.dart';

///Widget that shows singe color on background
class SingleColorContainer extends StatefulWidget {
  ///Default const constructor
  const SingleColorContainer({super.key});

  @override
  State<SingleColorContainer> createState() => _SingleColorContainerState();
}

class _SingleColorContainerState extends State<SingleColorContainer> {

  ///Color for show on background
  Color _currentColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentColor = getRandomColor();
        });
      },
      child: Container(
        color: _currentColor,
        alignment: Alignment.center,
        child: const Text('Hello there'),
      ),
    );
  }
}
