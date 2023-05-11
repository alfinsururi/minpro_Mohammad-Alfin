class Validator {
  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    print("vvvv: $value");
    if (value is String || value == null) {
      if (value.toString() == "null") return "This field is required";
      if (value.isEmpty) return "This field is required";
    }
    return null;
  }
}
