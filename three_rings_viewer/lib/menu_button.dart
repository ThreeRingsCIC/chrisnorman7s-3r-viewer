import 'package:flutter/material.dart';

import 'api_key_form.dart';
import 'constants.dart';
import 'settings.dart';
import 'util.dart';

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> menuItems = <String, Widget>{
      '${settings.apiKey == null ? "Set" : "Change"} API Key': ApiKeyForm(),
    };
    tabs.forEach(
      (String name, Widget tab) => menuItems[name] = tab
    );
    return PopupMenuButton<Widget>(
      icon: Icon(Icons.settings),
      tooltip: 'Menu',
      itemBuilder: (BuildContext context) {
        final List<PopupMenuItem<Widget>> popupMenuItems = <PopupMenuItem<Widget>>[];
        menuItems.forEach(
          (String name, Widget widget) => popupMenuItems.add(
            PopupMenuItem<Widget>(
              child: Text(name),
              value: widget,
            )
          )
        );
        return popupMenuItems;
      },
      onSelected: (Widget widget) => pushRoute(context, widget)
    );
  }
}
