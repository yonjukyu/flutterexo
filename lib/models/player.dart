import 'dart:math';

import 'package:bot/models/bot.dart';

class Player{
  String pseudo= "";
  int strength = 20;
  int hp=100;
  int victoire = 0;

  Player(String name, int st, int hps){
    pseudo= name;
    strength = st;
    hp = hps;
  }

  void getHit(int damages){
    hp -= damages;
  }

  void hit(Bot bot, int damages){
    bot.hp -= damages;
  }
  void heal( int increment){
    victoire += increment *2;
    hp = 100 + victoire *10;
    strength += victoire*10;
  }

  int attaqueNulle(int damage){
    print("l'attaque est effective mais nulle,  vous infligez ${damage~/2} dégats");
    return damage~/2;
  }
  int attaqueForeMaisQuiCouteDesHp(int damage){
    print("l'attaque est effective vous infligez ${damage*2} dégats \n"
        "Mais perdez 20hp");
    hp -= 20;
    return damage*2;
  }
  int attaqueForteMaisAUneChanceSurDeuxDePasser(int damage){
    Random random = Random();
    if(random.nextInt(2) +1 == 1){
      print("aaah pas de chance ce n'est pas passé");
      return 0;
    }
    print("La chance ! l'attaque est effective vous infligez ${damage*2} dégats");
    return damage*2;
  }

}