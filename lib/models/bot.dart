import 'package:bot/models/player.dart';

import 'fighter.dart';

class Bot extends Fighter{
  int _strength = 20;
  int _hp=100;

  Bot(int st, int hps):
    super(st, hps);

  void hit(Player player, int damages){
    player.hp -= damages;
  }

  int get strength => _strength;

  set strength(int value) {
    _strength = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }
}