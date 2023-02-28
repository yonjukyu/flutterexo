import 'dart:io';
import 'dart:math';

void readEnter(String answer) {
  print(answer);
  stdin.readLineSync();
}

String readString(String answer) {
  print(answer);
  String? value;
  do {
    value = stdin.readLineSync();
  } while (value == null || value.isEmpty);
  return value;
}

int throwDices(String name, int strength){
  print("$name à lancé les dés");
  Random random = Random();
  int diceOne = random.nextInt(6)+1;
  int diceTwo = random.nextInt(6)+1;
  int total = diceOne+diceTwo + strength;
  print("$name infilge un total de $total points de dégats");
  return total;
}