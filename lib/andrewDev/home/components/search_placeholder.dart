import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../screen_size_config.dart';

class SearchPlaceHolder extends StatelessWidget {
  final String message;

  const SearchPlaceHolder({@required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(CupertinoIcons.search,
              size: getProportionateScreenWidth(75.0), color: kTextHintColor),
          SizedBox(height: getProportionateScreenHeight(kDefaultPadding)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextHintColor,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
