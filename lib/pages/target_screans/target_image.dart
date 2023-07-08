import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TargetImage extends StatefulWidget {
  const TargetImage({super.key});

  @override
  State<TargetImage> createState() => _TargetImageState();
}

class _TargetImageState extends State<TargetImage> {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      child: Expanded(
          child: Image(
        image: AssetImage('images/blink_bilde.jpg'),
      )),
    );
  }
}
