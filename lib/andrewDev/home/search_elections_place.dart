import 'package:elections/screen_size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SearchElections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig _sizeConfig = SizeConfig();
    _sizeConfig.init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
