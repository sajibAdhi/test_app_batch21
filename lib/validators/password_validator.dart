String? passwordValidator(value, hintText) {
  if (value!.isEmpty || value.length < 7) {
    return "Please Enter valid , $hintText";
  } else {
    return null;
  }
}
