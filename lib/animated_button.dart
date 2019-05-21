import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  var text = "";
  var icon = Icons.add;
  Color color = Colors.pinkAccent;
  var duration = Duration(seconds: 1);
  var isPressed = false;

  Function onTap;

  AnimatedButton({this.text, this.icon, this.color, this.duration, this.isPressed, this.onTap});

  @override
  _AnimatedButtonState createState() {
    return _AnimatedButtonState();
  }
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    print("rebuild " + widget.text);
    return _buildNotAnimated();
  }

  Widget _buildAnimated() {
    // return AnimatedContainer(
    //   duration: Duration(seconds: 5),
    //   child: buildNotAnimated(),
    //   curve: Curves.bounceInOut,
    // );

    return _buildNotAnimated();
  }

  Row _buildNotAnimated() {
    print("**" + widget.text + " " + widget.isPressed.toString() + "**");
    isPressed = widget.isPressed;
    return Row(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          child: AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: isPressed ? widget.color.withOpacity(0.5): Colors.white
            ),
            padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
            child: Row(
              children: [
                Icon(widget.icon, color: (isPressed? widget.color: Colors.black)),
                Padding(padding: EdgeInsets.only(right: 8)),
                AnimatedSize(
                  duration: widget.duration,
                  curve: Curves.easeInOut,
                  vsync: this,
                  child: Text(
                    isPressed ? widget.text: '',
                    style: TextStyle(
                      color: (isPressed? widget.color: Colors.black),
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    )
                  ),
                )
              ]
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }

  void onTap() {
    setState(() {
      isPressed = !isPressed;
    });
    widget.onTap();
  }

  void selected(bool isSelected) {
    setState(() {
      isPressed = isSelected;
    });
  }
}
