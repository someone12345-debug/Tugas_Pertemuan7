class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;
  UserSession._internal();

  Map<String, dynamic>? _userData;

  void saveUser(Map<String, dynamic> data) {
    _userData = data;
  }

  Map<String, dynamic>? getUser() {
    return _userData;
  }

  void clearUser() {
    _userData = null;
  }

  bool isLoggedIn() {
    return _userData != null;
  }
}