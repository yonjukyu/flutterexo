import 'dart:io';
import 'dart:math';
import 'package:bot/assets/dessin.dart';
import 'package:bot/models/bot.dart';
import 'package:bot/models/player.dart';
import 'package:bot/services/botServices.dart';
import 'package:bot/services/playerService.dart';
import 'package:bot/services/utils.dart';



void main(List<String> arguments) {
  List<Bot> bot = [];
  int botNumber = 1 ;
  repopulateBots(bot, botNumber);
  String name = readString("entrez votre nom svp");
  Player player = Player(name, 20, 100);
  Random random = Random();
  int tour = 0;
  do {
    print("--------------------------------------$botNumber");
    tour++;
    int dice = random.nextInt(2)+1;
    if(dice == 1) {
      if(!playerDamageBot(player, bot, botNumber)){
        sleep(const Duration(seconds: 2));
        botsTurn(player, bot);
      }
    }
    else {
      if (!botsTurn(player, bot)) {
        sleep(const Duration(seconds: 2));
        playerDamageBot(player, bot, botNumber);
      }
    }
    print("Fin du tour $tour");
    print("prochain tour dans 5 secondes");
    sleep(const Duration(seconds: 5));
    print("");
  } while(player.hp > 0);
  print("vous etes mort");
  print("tempis ");
  print(teteDeMort);
}