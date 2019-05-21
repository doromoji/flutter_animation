import 'package:flutter/material.dart';
import 'animated_button.dart';

class BottomNavigationBar extends StatefulWidget {

  var buttons = [
    { 'text': 'Home', 'icon': Icons.home, 'color': Colors.amber.shade300 },
    { 'text': 'Profiles', 'icon': Icons.portrait, 'color': Colors.red.shade300 },
    { 'text': 'Contacts', 'icon': Icons.contacts, 'color': Colors.green.shade300 },
    { 'text': 'Store', 'icon': Icons.shopping_cart, 'color': Colors.blue.shade300 }
  ];

  BottomNavigationBar({
    Key key,
  }) : super(key: key);


  @override
  _BottomNavigationBarState createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("rebuild bottom nav");
    return Material(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: _buildButtons(),
        )
      ),
    );
  }

  List<Widget> _buildButtons() {
    List<Widget> _buttonWidgets = [];
    for (var i=0; i<widget.buttons.length; i++) {
      print("add button " + i.toString() + " isPressed " + (i==selectedIndex? true: false).toString());
      _buttonWidgets.add(
        AnimatedButton(
          color: widget.buttons[i]['color'],
          duration: Duration(milliseconds: 300),
          icon: widget.buttons[i]['icon'],
          text: widget.buttons[i]['text'],
          isPressed: (i==selectedIndex? true: false),
          onTap: () => onTap(i),
        )
      );
    }
    return _buttonWidgets;
  }

  onTap(int i) {
    setState(() {
      selectedIndex = i;
      print("selectedIndex " + selectedIndex.toString());
    });
  }
}
