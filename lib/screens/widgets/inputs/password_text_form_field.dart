import 'package:flutter/material.dart';
import 'package:test_app_batch21/validators/password_validator.dart';

import 'underline_input_border_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;

  const PasswordTextFormField(
      {Key? key,
      this.controller,
      this.initialValue,
      this.hintText,
      this.focusNode,
      this.onEditingComplete,
      this.textInputAction})
      : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        validator: (value) => passwordValidator(value),
        obscureText: _obsecureText,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              _obsecureText = !_obsecureText;
            }),
            child: Icon(
              _obsecureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
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
