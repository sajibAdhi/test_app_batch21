import 'package:flutter/material.dart';
import 'package:test_app_batch21/validators/email_validator.dart';
import 'package:test_app_batch21/widgets/inputs/underline_input_border_colors.dart';

class PasswordTextFormField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        validator: (value) => emailValidator(value),
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText,
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
