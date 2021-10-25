import 'package:flutter/material.dart';
import 'package:test_app_batch21/validators/email_validator.dart';

import 'underline_input_border_colors.dart';

class EmailTextFromField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;

  const EmailTextFromField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.focusNode,
      this.onEditingComplete,
      this.textInputAction})
      : super(key: key);

  @override
  _EmailTextFromFieldState createState() => _EmailTextFromFieldState();
}

class _EmailTextFromFieldState extends State<EmailTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        validator: (value) => emailValidator(value),
        keyboardType: TextInputType.emailAddress,
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
