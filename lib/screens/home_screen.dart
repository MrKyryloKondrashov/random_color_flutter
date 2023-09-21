import 'package:flutter/material.dart';
import 'package:random_color_app/utils/background_color_mode.dart';
import 'package:random_color_app/widgets/linear_gradient_container.dart';
import 'package:random_color_app/widgets/radial_gradient_container.dart';
import 'package:random_color_app/widgets/single_color_container.dart';
import 'package:random_color_app/widgets/switch_color_drawer.dart';


///Start screen of app
class HomeScreen extends StatefulWidget {
  ///Default const constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BackgroundColorMode currentMode = BackgroundColorMode.singleColor;
  Map<BackgroundColorMode, bool> filters = {...kFilters};

  @override
  void initState() {
    super.initState();
    filters[currentMode] = true;
  }

  ///Method to switch between background mode
  ///@param isActive: status of SwitchListTile
  ///@param mode: enum to determine which mode to change
  void _changeColorMode({required bool isActive,
                        required BackgroundColorMode mode,}) {
    filters = {...kFilters, mode: isActive};
    setState(() {
      if (!filters.values.contains(true)) {
        filters[BackgroundColorMode.singleColor] = true;
        currentMode = BackgroundColorMode.singleColor;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: 
                  Text('Set back to default single color mode',),
                  duration: Duration(seconds: 10),),);
      } else {
        currentMode = mode;
      }
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const SingleColorContainer();
    switch (currentMode) {
      case BackgroundColorMode.linearGradient:
        {
          content = const LinearGradientContainer();
        }
      case BackgroundColorMode.radialGradient:
        {
          content = const RadialGradientContainer();
        }
      default:
        {
          break;
        }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Color Random Generator'),
          centerTitle: true,
        ),
        drawer:
            SwitchColorDrawer(filters: filters, 
            changeColorMode: _changeColorMode,),
        body: content,);
  }
}
