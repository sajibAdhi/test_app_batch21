String?  emailValidator(value) {
  if (value!.isEmpty || !value.contains('@')) {
    return "Please Enter valid email";
  } else {
    return null;
  }
}
