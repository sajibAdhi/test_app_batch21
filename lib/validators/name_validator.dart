String? nameValidator(value, hintText) {
  if (value!.isEmpty) {
    return "Please Enter valid $hintText";
  } else {
    return null;
  }
}
