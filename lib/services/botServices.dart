import 'package:bot/models/bot.dart';
import 'package:bot/services/utils.dart';
import '../models/player.dart';

bool botsTurn(Player player, List<Bot> bot){
  print("------------Tour des Bots--------------");
  bool returnedBool = false;
  int botNumber = 0;
  bot.forEach((bot) {
    print("Le bot ${++botNumber} lance les dés pour vous taper !");
    bot.hit(player, throwDices("bot", bot.strength));

    if( player.hp > 0) {
      print("Il vous reste ${player.hp} hp");
    } else {
      print("Vous êtes mort nullos");
      returnedBool = true;
    }
    print("");
  });

  print("");
  return returnedBool;
}

void repopulateBots(List<Bot> bots, int number) {
  for(int i = 0; i < number; i++){
    bots.add(Bot(10, 100));
  }
}