bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
  return passwordRegex.hasMatch(password);
}

bool isValidPhoneNumber(String password) {
  final RegExp passwordRegex = RegExp(r'\b(?:079|078|077)\d{7}\b');
  return passwordRegex.hasMatch(password);
}
