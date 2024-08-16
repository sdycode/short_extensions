bool isPhoneNumberValid(String contactNumber) {
  // Original function name: validatePhoneNumber
  String digitsOnly = contactNumber.replaceAll(RegExp(r'\D'), '');

  return digitsOnly.length >=
      10; // Adjust the condition based on your validation criteria
}
