import 'package:elections/screen_size_config.dart';
import 'package:flutter/material.dart';

import 'field.dart';

// انتخبو مين الغواص و حببكو
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _SSN = "";
  TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _editingController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.search,
                maxLength: 14,
                style: TextStyle(fontSize: 22.0),
                onChanged: (query) => _updateSearchQuery(query),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                  hintText: 'ادخل الرقم القومي',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25.0)),
              Field(
                label: 'الاسم',
                data: ['محمد محمد الغواص'],
              ),
              Field(
                label: 'رقم اللجنة الفرعية',
                data: ['515'],
              ),
              Field(
                label: 'مقر اللجنة',
                data: ['مدرسة الشهيد محمد فهمي الطوخي الابتدائية'],
              ),
              Field(
                label: 'عنوان اللجنة',
                data: ['مركز طوخ - مدينة طوخ ش الشهيد محمد فهمي الطوخي'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSearchQuery(String query) {
    if (query.isNotEmpty && query.length == 14)
      setState(() {
        _SSN = query;
      });
  }

  _performSearch() {
    //TODO: search in database
    print("object");
  }
}
