import 'package:flutter/material.dart';

class EmailTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  const EmailTextFromField(
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
        textInputAction: TextInputAction.next,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return "Please Enter valid email";
          } else {
            return null;
          }
        },
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
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
