import 'account.dart';

class Admin extends Account {
  const Admin({required String username, required String email})
      : super(username: username, email: email);

  @override
  void mostraInfo() {
    print('Sono un admin e la mia email è $email');
  }
}
