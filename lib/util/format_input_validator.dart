class FormatInputValidator {
  String? validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }
    return null;
  }
}
