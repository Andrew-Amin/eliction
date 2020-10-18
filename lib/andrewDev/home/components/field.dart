import 'package:elections/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../screen_size_config.dart';

class Field extends StatelessWidget {
  final String label;
  final String data;

  Field({@required this.label, @required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(22.0),
              color: Colors.white70,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: getProportionateScreenHeight(kDefaultPadding)),
            child: TypewriterAnimatedTextKit(
              text: [data],
              textStyle: TextStyle(
                fontSize: getProportionateScreenWidth(25.0),
                color: Colors.white,
              ),
              speed: Duration(milliseconds: 100),
              totalRepeatCount: 1,
            ),
          ),
          Divider(
            endIndent: getProportionateScreenWidth(kDefaultPadding / 2),
            indent: getProportionateScreenWidth(kDefaultPadding / 2),
          )
        ],
      ),
    );
  }
}
