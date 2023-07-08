import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoveableStackItem extends StatefulWidget {
  MoveableStackItem(
      {required this.x,
      required this.name,
      required this.y,
      required this.movebel,
      this.minuter = false});
  double x;
  double y;
  int name;
  bool movebel;
  bool minuter;
  @override
  State<MoveableStackItem> createState() => _MoveableStackItemState();
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  TextStyle textStyle() {
    if (widget.minuter) {
      return TextStyle(color: Colors.white, fontSize: 10);
    } else {
      return TextStyle(color: Colors.white);
    }
  }

  double size = 30;
  @override
  Widget build(BuildContext context) {
    if (widget.minuter) {
      size = 13;
    }
    return Positioned(
      top: widget.y,
      left: widget.x,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          if (widget.movebel) {
            setState(() {
              widget.x += tapInfo.delta.dx;
              widget.y += tapInfo.delta.dy;
            });
          }
        },
        child: Container(
          width: size,
          height: size,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(widget.name.toString(), style: textStyle()),
            ),
          ),
        ),
      ),
    );
  }
}
