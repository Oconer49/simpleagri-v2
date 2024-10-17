import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({Key? key, required this.text, this.back});

  final String text;
  final VoidCallback? back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.home),
            color: Colors.lightGreen,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.lightGreen),
      ),
      actions: back == null
          ? []
          : [IconButton(icon: Icon(Icons.arrow_back), onPressed: back)],
      foregroundColor: const Color(0xFF8cc36f),
    );
  }
}