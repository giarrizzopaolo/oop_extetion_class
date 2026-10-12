import 'account.dart';

class Guest extends Account {
  const Guest({super.username, super.email});

  @override
  void mostraInfo() {
    print('Sono un guest con username $username');
  }
}
