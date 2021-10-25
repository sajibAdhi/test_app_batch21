String? passwordValidator(value) {
  if (value!.isEmpty || value.length < 7) {
    return "Please Enter valid Password";
  } else {
    return null;
  }
}
