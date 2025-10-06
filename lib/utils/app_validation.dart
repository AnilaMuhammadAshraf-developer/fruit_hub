class AppValidation {
  String? isEmptyField(dynamic? value, String field) {
    print("this is field : $field");
    if (value == null) {
      return "$field can't be empty.";
    }

    if (value is String && value.trim().isEmpty) {
      return "$field can't be empty.";
    }

    return null;
  }
}
