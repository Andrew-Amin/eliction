import 'package:elections/andrewDev/data/Database.dart';
import 'package:elections/andrewDev/data/PersonModel.dart';
import 'file:///C:/Users/Other/Desktop/elections/lib/andrewDev/constants.dart';
import 'file:///C:/Users/Other/Desktop/elections/lib/andrewDev/screen_size_config.dart';
import 'package:flutter/material.dart';

import 'result_field.dart';
import 'search_field.dart';

// انتخبو مين الغواص و حببكو
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _editingController = TextEditingController();
  var _database;
  var _personDao;
  Future<Person> _person;
  bool _clear = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding / 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                editingController: _editingController,
                onChange: (query) => _updateSearchQuery(query),
              ),
              SizedBox(height: getProportionateScreenHeight(kDefaultPadding)),
              ResultFields(
                person: _person,
                clear: _clear,
              )
            ],
          ),
        ),
      ),
    );
  }

  void init() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('election_database.db').build();
    _personDao = _database.personDao;
//    Person temp = Person(
//        '22223333444455',
//        'محمد محمد الغواص',
//        '512',
//        'مدرسة الشهيد محمد فتحي الابتدائية',
//        'مركز طوخ - مدينة طوخ ش الشهيد محمد فتحي الطوخي');
//    _personDao.insertPerson(temp);
    final result = await _personDao.getAll();
    print(result.length);
  }

  void _updateSearchQuery(String query) {
    if (query.isNotEmpty && query.length == 14) {
      setState(() {
        if (_clear) _clear = false;
      });
      _person = _personDao.getUserBySsn(query);
    } else
      _clearSearchResultsUi();
  }

  void _clearSearchResultsUi() {
    setState(() {
      _clear = true;
    });
  }
}
