import 'dart:math';
import 'package:bot/models/bot.dart';
import 'package:bot/models/weapon.dart';
import 'package:bot/models/weapon_list.dart';

import 'fighter.dart';

class Player extends Fighter{
  String _pseudo= "";
  int _strength = 20;
  int _hp=100;
  int _victoire = 0;
  Weapon _weapon = WeaponList().getBaseWeapon();
  Random random = Random();

  Player(String name, int st, int hps): super(st, hps){
    _pseudo= name;
  }

  void hit(Bot bot, int damages){
    bot.hp -= damages;
  }
  void heal( int increment){
    _victoire += increment * 2;
    _hp = 100 + _victoire *3;
    _strength += _victoire*3;
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
    if(random.nextInt(2) +1 == 1){
      print("aaah pas de chance ce n'est pas passé");
      return 0;
    }
    print("La chance ! l'attaque est effective vous infligez ${damage*2} dégats");
    return damage*2;
  }

  int get victoire => _victoire;

  set victoire(int value) {
    _victoire = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  int get strength => _strength;

  set strength(int value) {
    _strength = value;
  }

  String get pseudo => _pseudo;

  set pseudo(String value) {
    _pseudo = value;
  }

  Weapon get weapon => _weapon;

  set weapon(Weapon value) {
    _weapon = value;
  }


}