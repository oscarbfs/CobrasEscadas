import 'package:flame/components.dart';

class Player {
  late SpriteComponent _avatar;
  late TextComponent _menssage;
  late SpriteComponent _button;

  Player({
    required avatar,
    required button,
    required menssage,
  }) : super() {
    this._avatar = avatar;
    this._menssage = menssage;
    this._button = button;

    init();
  }

  @override
  void init() {}
}
