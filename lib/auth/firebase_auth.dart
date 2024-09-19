abstract class FirebaseAuth {
  Future<void> registerUser(
      String email, String password, String confirmPassword);

  Future<void> logIn(String email, String password);
}

class AuthRemote extends FirebaseAuth {
  @override
  Future<void> registerUser(
      String email, String password, String confirmPassword) async {}

  @override
  Future<void> logIn(String email, String password) async {}
}
