String?  emailValidator(value, hintText) {
  if (value!.isEmpty || !value.contains('@')) {
    return "Please Enter valid $hintText";
  } else {
    return null;
  }
}
