class Fighter {
  int _strength = 0;
  int _hp = 0;

  Fighter(this._strength, this._hp);

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  int get strength => _strength;

  set strength(int value) {
    _strength = value;
  }
}