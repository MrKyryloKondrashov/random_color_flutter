import 'package:flutter/material.dart';
import 'package:random_color_app/utils/background_color_mode.dart';
import 'package:random_color_app/utils/color_generator.dart';
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
  BoxDecoration boxDecoration = BoxDecoration(
        color: getRandomColor(),
    );
  //List<Color> color;

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
      _changeColor();
  }

  void _changeColor(){
    setState(() {
      boxDecoration = BoxDecoration(
        color: getRandomColor(),
    );

    if(currentMode == BackgroundColorMode.linearGradient){
      boxDecoration = BoxDecoration(
          gradient: LinearGradient(colors: [getRandomColor(),  
                                            getRandomColor()],
          begin: Alignment.topLeft,
          end : Alignment.bottomRight,),
        );
    }

    if(currentMode == BackgroundColorMode.radialGradient){
      boxDecoration = BoxDecoration(
            gradient: RadialGradient(
          colors: [getRandomColor(), getRandomColor()],
        ),);
    }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color Random Generator'),
          centerTitle: true,
        ),
        drawer:
            SwitchColorDrawer(filters: filters, 
            changeColorMode: _changeColorMode,),
        body:  InkWell(
      onTap: _changeColor,
      child: Container(
       decoration: boxDecoration,
        alignment: Alignment.center,
        child: const Text('Hello there'),
      ),
    ),);
  }
}
