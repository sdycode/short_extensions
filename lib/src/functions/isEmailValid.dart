bool isEmailValid(String emailAddress) {
  // Original function name: validateEmailAddress
  // Regular expression pattern to validate email addresses
  RegExp regex = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the email address matches the pattern
  return regex.hasMatch(emailAddress);
}