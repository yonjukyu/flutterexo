import 'package:bot/assets/dessin.dart';
import 'package:bot/models/bot.dart';
import 'package:bot/models/player.dart';
import 'package:bot/services/botServices.dart';
import 'package:bot/services/utils.dart';


bool playerDamageBot(Player player, List<Bot> bot, int botNumber){
  bool booleanToReturn = false;
  print("------------Tour du Joueur--------------");
  readEnter("Appuyez sur entrée pour lancer les dés !");
  int damages = choixAttaque( throwDices(player.pseudo, player.strength), player);
  player.hit(bot.first, damages);
  if( bot.first.hp > 0) {
    print("Il reste ${bot.first.hp} hp au bot\n"
        "Et il reste ${bot.length} bots");
  } else {
    print("Vous avez tué le bot");
    bot.remove(bot.first);
    print("il reste ${bot.length} bots");
    if(bot.isEmpty){
      restart(bot, player, botNumber);
      booleanToReturn = true;
    }
  }
  print("");
  return booleanToReturn;
}

void restart(List<Bot> bot, Player player, int botNumber){
  print("vous avez tué le bot bravo !");
  print(coupe);
  print("**************************************\n"
      "appuez sur entrer pour relancer une partie \n"
      "*************************************\n");
  player.heal(botNumber);
  repopulateBots(bot, ++botNumber);
  readEnter("vous aurez ${player.hp} hp, vos dégats s'amélioreront mais il y aura 1 bot en plus");

}

int choixAttaque(int diceRoll, Player player){
  print("Voici vos choix d'attaque");
  print("1: Attaque nulle mais qui touche forcément");
  print("2: Attaque Forte mais qui coute des hp");
  print("3: Attaque Forte mais qui à une chance sur deux de passer");

  String response = "youhou";
  int damages = 0;
  do {
    response = readString("Entrez votre choix :");
  }while(response != "1" && response != "2" && response != "3");

  switch(response){
    case "1": {
      damages = player.attaqueNulle(diceRoll);
    } break;
    case "2": {
      damages = player.attaqueForeMaisQuiCouteDesHp(diceRoll);
    } break;
    case "3": {
      damages = player.attaqueForteMaisAUneChanceSurDeuxDePasser(diceRoll);
    } break;
  }
  return damages;
}
