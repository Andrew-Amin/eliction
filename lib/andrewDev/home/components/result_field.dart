import 'package:elections/andrewDev/data/PersonModel.dart';
import 'package:elections/constants.dart';
import 'package:elections/screen_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'field.dart';
import 'search_placeholder.dart';

class ResultFields extends StatelessWidget {
  ResultFields({
    @required Future<Person> person,
    clear,
  })  : _person = person,
        _clear = clear;

  final Future<Person> _person;
  final bool _clear;

  final String _firstMessage =
      'البحث عن رقم و مكان لجنة الانتخابات \n بإستخدام الرقم القومي';
  final String _noResultMessage = 'لا توجد بيانات';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Person>(
        future: _person,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return !_clear
                ? Column(
                    children: [
                      Field(label: 'الاسم : ', data: snapshot.data.name),
                      Field(
                          label: 'رقم اللجنة الفرعية : ',
                          data: snapshot.data.committeeNumber),
                      Field(
                          label: 'مقر اللجنة : ',
                          data: snapshot.data.committeeAddress),
                      Field(
                          label: 'عنوان اللجنة : ',
                          data: snapshot.data.committeeDetail)
                    ],
                  )
                : SearchPlaceHolder(
                    message: _noResultMessage,
                  );
          } else
            return SearchPlaceHolder(message: _firstMessage);
        });
  }
}
