import 'package:bot/models/player.dart';

class Bot{
  int strength = 20;
  int hp=100;

  Bot(int st, int hps){
    strength = st;
    hp = hps;
  }
  void infos(){
    print("strength: $strength hp: $hp");
  }

  void getHit(int damages){
    hp -= damages;
  }

  void hit(Player player, int damages){
    player.hp -= damages;
  }

  void resurect(){
    hp = 100;
  }
}