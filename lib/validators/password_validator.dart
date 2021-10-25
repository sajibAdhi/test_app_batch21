String? passwordValidator(value) {
  if (value!.isEmpty || value < 7) {
    return "Please Enter valid Password";
  } else {
    return null;
  }
}
