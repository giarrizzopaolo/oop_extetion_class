import 'dart:io';

import 'package:ereditarieta_app/src/abstract_calss/account.dart';
import 'package:ereditarieta_app/src/abstract_calss/admin.dart';
import 'package:ereditarieta_app/src/abstract_calss/guest.dart';

void main() {
  print('=== Accesso account ===');
  print('Esempio didattico: non viene verificata alcuna password.');
  print('1. Admin');
  print('2. Guest');
  print('0. Esci');

  String? scelta;
  while (true) {
    scelta = leggiCampo('Scegli il tipo di account: ');
    if (scelta == null || scelta == '0') {
      return;
    }
    if (scelta == '1' || scelta == '2') {
      break;
    }
    print('Scelta non valida. Inserisci 1, 2 oppure 0.');
  }

  final username = leggiCampo('Username: ');
  if (username == null) {
    return;
  }

  String? email;
  while (true) {
    email = leggiCampo('Email: ');
    if (email == null) {
      return;
    }
    if (RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      break;
    }
    print('Email non valida. Usa un formato come nome@example.com.');
  }

  final Account account = scelta == '1'
      ? Admin(username: username, email: email)
      : Guest(username: username, email: email);

  account.login();
  account.mostraInfo();
}

String? leggiCampo(String richiesta) {
  while (true) {
    stdout.write(richiesta);
    final valore = stdin.readLineSync();
    if (valore == null) {
      stderr.writeln('Input terminato: accesso annullato.');
      exitCode = 1;
      return null;
    }
    final campo = valore.trim();
    if (campo.isNotEmpty) {
      return campo;
    }
    print('Il campo non puo essere vuoto.');
  }
}
