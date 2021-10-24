import 'package:flutter/material.dart';
import 'package:test_app_batch21/validators/email_validator.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  const PasswordTextFormField(
      {Key? key,
      this.controller,
      this.hintText,
      this.focusNode,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => emailValidator(value),
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
         errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ), 
        ),
      ),
    );
  }
}
