import 'package:flutter/material.dart';
import 'package:test_app_batch21/validators/name_validator.dart';

import 'underline_input_border_colors.dart';

class NameTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;

  const NameTextFormField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.focusNode,
      this.onEditingComplete,
      this.textInputAction})
      : super(key: key);

  @override
  _NameTextFormFieldState createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        validator: (value) => nameValidator(value, widget.hintText),
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorderColors.white,
          focusedBorder: UnderlineInputBorderColors.yellow,
          errorBorder: UnderlineInputBorderColors.red,
        ),
      ),
    );
  }
}
