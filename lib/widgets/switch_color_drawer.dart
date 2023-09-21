import 'package:flutter/material.dart';
import 'package:random_color_app/utils/background_color_mode.dart';

///Class for settings menu to set active mode
class SwitchColorDrawer extends StatelessWidget{
  ///Default const constructos.
  ///@param filters: statuses of SwitchListTile
  ///@param changeColorMode: function to call on change of SwitchListTile
  const SwitchColorDrawer({required this.filters, 
                      required this.changeColorMode, 
                      super.key,});

  /// Filters to show active filter and disabled filters
  final Map<BackgroundColorMode, bool> filters;
  ///Function to change active filter
  final void Function({required bool isActive, 
                      required BackgroundColorMode mode,}) changeColorMode;

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: [
              const ListTile(title: Text('Select mode')),
              SwitchListTile(
                  title: const Text('Single color mode'),
                  onChanged: (isChecked) {
                    changeColorMode(isActive : isChecked,
                    mode : BackgroundColorMode.singleColor,);
                  },
                  value: filters[BackgroundColorMode.singleColor]!,),
              SwitchListTile(
                  title: const Text('Linear gradient mode'),
                  onChanged: (isChecked) {
                     changeColorMode(isActive : isChecked,
                                     mode :BackgroundColorMode.linearGradient,);
                  },
                  value: filters[BackgroundColorMode.linearGradient]!,),
              SwitchListTile(
                  title: const Text('Radial gradient mode'),
                    onChanged: (isChecked) {
                     changeColorMode(isActive :isChecked, 
                                    mode :BackgroundColorMode.radialGradient,);
                  },
                  value: filters[BackgroundColorMode.radialGradient]!,),
            ],
          ),
        );
  }
}
