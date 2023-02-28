import 'dart:math';

import 'package:bot/assets/dessin.dart';
import 'package:bot/models/bot.dart';
import 'package:bot/models/player.dart';
import 'package:bot/models/weapon.dart';
import 'package:bot/models/weapon_list.dart';
import 'package:bot/services/botServices.dart';
import 'package:bot/services/utils.dart';


bool playerDamageBot(Player player, List<Bot> bot, int botNumber, int tour){
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
      tour = 0;
      booleanToReturn = true;
    }
  }
  print("");
  return booleanToReturn;
}

void restart(List<Bot> bot, Player player, int botNumber){
  print("vous avez tué le bot bravo !");
  print(coupe);

  if(WeaponList().hasNext(player.weapon)) {
    print(chest);
    print("**************************************\n"
        "appuez sur entrer pour ouvrir le coffre que vous avez trouvé\n"
        "*************************************\n");
    Weapon newWeapon = findObject(player);
    player.weapon = chooseWeapon(newWeapon, player);
    print("Vous continuez votre aventure avec votre ${player.weapon.name}");
  }
  player.heal(botNumber);
  repopulateBots(bot, ++botNumber);
  readEnter("vous aurez ${player.hp} hp, vos dégats s'amélioreront mais il y aura 1 bot en plus");

}

Weapon chooseWeapon(Weapon newWeapon, Player player){
  print("Vous trouvez un ${newWeapon.name} dedans voulez vous le prendre voici ces statistiques");
  print("Nom : ${newWeapon.name} \n"
      "Damage : ${newWeapon.damages} \n"
      "Accuracy : ${newWeapon.accuracy} \n");
  print("Tapez 1 pour prendre \n"
      "Tapez 2 pour laisser");
  String response = "";
  do{
    response = readString("Reponse :");
  }while(response != "1" && response != "2");
  switch(response){
    case "1": {
      return newWeapon;
    }
    case "2": {
      return player.weapon;
    }
    default : {
      return player.weapon;
    }
  }

}
Weapon findObject(Player player){
  return WeaponList().getNextWeapon(player.weapon);
}

void restartAfterLoss(List<Bot> bot, Player player, int botNumber){
  print("RECOMMENÇAGE");
  repopulateBots(bot, 1);
  print(cat);
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

  print("vous êtes équipé d'un ${player.weapon.name} vous avez donc ${player.weapon.accuracy}% "
      "de chance de réussir votre attaque");
  Random random = Random();
  if(random.nextInt(100)+1 <= player.weapon.accuracy) {
    switch (response) {
      case "1":
        {
          damages = player.attaqueNulle(diceRoll * player.weapon.damages);
        }
        break;
      case "2":
        {
          damages = player.attaqueForeMaisQuiCouteDesHp(diceRoll * player.weapon.damages);
        }
        break;
      case "3":
        {
          damages = player.attaqueForteMaisAUneChanceSurDeuxDePasser(diceRoll * player.weapon.damages);
        }
        break;
    }
  }
  else{
    print("Votre arme à raté son coup c'est dommage !");
  }
  return damages;
}
