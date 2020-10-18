import 'package:flutter/material.dart';

typedef ValueChanged<T> = void Function(T value);

class SearchField extends StatefulWidget {
  const SearchField({
    @required TextEditingController editingController,
    @required Function onChange,
  })  : _editingController = editingController,
        _onChange = onChange;

  final TextEditingController _editingController;
  final ValueChanged<String> _onChange;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget._editingController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.search,
      maxLength: 14,
      style: TextStyle(fontSize: 22.0),
      onEditingComplete: () {
        widget._onChange(widget._editingController.text);
        if (_focusNode.hasFocus) _focusNode.unfocus();
      },
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).textTheme.bodyText2.color,
        ),
        suffix: GestureDetector(
          onTap: () {
            setState(() {
              widget._editingController.clear();
              if (_focusNode.hasFocus) _focusNode.unfocus();
            });
            print("suffix on tap");
          },
          child: Icon(
            Icons.close,
            color: Colors.white54,
          ),
        ),
        hintText: 'ادخل الرقم القومي ...',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
