import 'package:bot/models/weapon.dart';

class WeaponList {
  final List<Weapon> weaponList = [
  Weapon("Little Gun", 100, 1),
  Weapon("Machine Gun", 85, 3),
  Weapon("Automobile", 50, 20)
  ];

  Weapon getNextWeapon(Weapon actualWeapon){
    int indexOfWeapon = weaponList.indexWhere((element) => element.name == actualWeapon.name);
    if(indexOfWeapon +1 <= weaponList.length){
      return weaponList.elementAt(indexOfWeapon+1);
    }
    else return actualWeapon;
  }

  Weapon getBaseWeapon(){
    return weaponList.elementAt(0);
  }

  bool hasNext(Weapon actualWeapon){
    int indexOfWeapon = weaponList.indexWhere((element) => element.name == actualWeapon.name);
    if(indexOfWeapon +1 <= weaponList.length){
      return true;
    }
    else{ return false;}
  }
}