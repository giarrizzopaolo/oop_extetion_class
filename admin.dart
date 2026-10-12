import 'account.dart';

class Admin extends Account {
  const Admin({super.username, super.email});

  @override
  void mostraInfo() {
    print('Sono un admin e la mia email è $email');
  }
}
