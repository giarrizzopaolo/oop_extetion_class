abstract class Account {
  final String username;
  final String email;

  const Account({required this.username, required this.email});

  void login() {
    print('Login effettuato per $username');
  }

  void mostraInfo();
}
