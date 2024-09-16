class FormValidations {
  const FormValidations._();

  static String? validateRequiredField(String? value) {
    if (value?.isEmpty ?? true) return 'Field cannot be empty.';
    return null;
  }

  static String? validateEmailField(String? value) {
    if (value?.isEmpty ?? true) return 'Field cannot be empty.';
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value ?? "");
    if (!emailValid) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
