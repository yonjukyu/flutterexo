import 'dart:io';
import 'dart:math';

import 'package:bot/assets/dessin.dart';
import 'package:bot/models/bot.dart';
import 'package:bot/models/player.dart';
import 'package:bot/services/playerService.dart';

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
  return total;
}

bool doYouRestart(Player player,List<Bot> bot, int botNumber){
  print("vous etes mort");
  print("tempis ");
  print(teteDeMort);
  print("******* VOULEZ VOUS CONTINUER ?************");
  print("Tapez 1 pour recommencer \n"
      "Tapez 2 pour arreter");
  String response = "";
  do{
    response = readString("Reponse :");
  }while(response != "1" && response != "2");

  switch(response){
    case "1": {
      player.hp = 100;
      player.strength = 10;
      player.victoire = 0;
      botNumber = 1;
      restartAfterLoss(bot, player, botNumber);
      return true;
    }

    case "2": {
      return false;
    }
    default : {
      return false;
    }
  }
}