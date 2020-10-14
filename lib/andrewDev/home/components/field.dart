import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../screen_size_config.dart';

class Field extends StatelessWidget {
  final String label;
  final List<String> data;

  Field({@required this.label, @required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label + ' : ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(22.0),
              color: Colors.white70,
            ),
          ),
          TypewriterAnimatedTextKit(
            text: data,
            textStyle: TextStyle(
              fontSize: getProportionateScreenWidth(25.0),
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 100),
            totalRepeatCount: 1,
          ),
        ],
      ),
    );
  }
}
