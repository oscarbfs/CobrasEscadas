import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class CobrasEscadas extends FlameGame with TapDetector {
  double get boardSizeXBegin => 0.0;
  double get boardSizeXEnd => size.x;
  double get boardSizeYBegin => size.y / 4.5;
  double get boardSizeYEnd => size.y / 4.5 + size.x;
  double get boardEdge => boardSizeYEnd - boardSizeYBegin;

  late SpriteComponent bluePlayerInBoard;
  late SpriteComponent redPlayerInBoard;
  late Button redPlayerButton;
  late Button bluePlayerButton;
  late TextComponent menssageOfRedPlayer;
  late TextComponent menssageOfBluePlayer;

  late String turnOf;

  late double positionBluePLayer;
  late double positionRedPLayer;

  bool dicesLauched = false;
  bool _gameFinished = false;

  Map<String, String> menssages = {
    'vez': 'É a sua vez de joagar',
    'cobra': 'Você caiu em uma cabeça de cobra',
    'escada': 'Você está no pé de uam escada',
    'ganhar': 'Você ganhou',
    'perdeu': 'Você perdeu',
  };

  @override
  Future<void>? onLoad() async {
    positionBluePLayer = 0;
    positionRedPLayer = 0;
    turnOf = 'BLue';
    print(boardEdge);
    await _start();
    return super.onLoad();
  }

  Future<void> _start() async {
    await _addTable();
    await _addBoard();
    await _addPlayersBar();
    await _addPlayersOnBoard();
  }

  Future<void> _addTable() async {
    add(
      SpriteComponent(
        sprite: await loadSprite('table.png'),
        size: size,
        position: Vector2.zero(),
      ),
    );
  }

  Future<void> _addBoard() async {
    add(
      SpriteComponent(
        sprite: await loadSprite('board.png'),
        size: Vector2(size.x, size.x),
        position: Vector2(0, boardSizeYBegin),
      ),
    );
  }

  Future<void> _addPlayersBar() async {
    add(
      SpriteComponent(
        sprite: await loadSprite('bluePlayer.png'),
        size: Vector2(size.x / 4, size.y - boardSizeYEnd - 10),
        position: Vector2(5, size.y / 4.5 + size.x + 5),
      ),
    );
    add(
      menssageOfBluePlayer = TextComponent(
        text: 'Você está na casa: ${positionBluePLayer.toInt()}',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 25,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        position: Vector2(110, size.y / 4.5 + size.x + 5),
      ),
    );
    bluePlayerButton = Button(
      component: SpriteComponent(size: Vector2(200, 100)),
      spriteButton: await loadSprite(
        'button.png',
        // srcPosition: Vector2(0, 0),
        // srcSize: Vector2(200, 100),
      ),
      spriteButtonPressed: await loadSprite(
        'buttonOnPressed.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(200, 100),
      ),
    )..active = true;
    bluePlayerButton.component.position =
        Vector2(130, (size.y / 4.5 + size.x + 5) + 40);
    add(bluePlayerButton.component);

    add(
      SpriteComponent(
        sprite: await loadSprite('redPlayer.png'),
        size: Vector2(size.x / 4, boardSizeYBegin - 10),
        position: Vector2(size.x - 5, boardSizeYBegin - 5),
        angle: 3.15,
      ),
    );
    add(
      menssageOfRedPlayer = TextComponent(
        text: 'Você está na casa: ${positionRedPLayer.toInt()}',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.red,
            fontSize: 25,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        angle: 3.15,
        position: Vector2(size.x - 110, boardSizeYBegin - 5),
      ),
    );
    redPlayerButton = Button(
      component: SpriteComponent(size: Vector2(200, 100)),
      spriteButton: await loadSprite(
        'button.png',
        // srcPosition: Vector2(0, 0),
        // srcSize: Vector2(200, 100),
      ),
      spriteButtonPressed: await loadSprite(
        'buttonOnPressed.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(200, 100),
      ),
    )..active = true;
    redPlayerButton.component.position =
        Vector2(size.x - 130, boardSizeYBegin - 50);
    redPlayerButton.component.angle = 3.15;
    add(redPlayerButton.component);
  }

  Future<void> _addPlayersOnBoard() async {
    add(
      redPlayerInBoard = SpriteComponent(
        sprite: await loadSprite('redPlayerInBoard.png'),
        size: Vector2(30, 40),
        position: _getPositionInBoard(positionRedPLayer, 10),
      ),
    );
    add(
      bluePlayerInBoard = SpriteComponent(
        sprite: await loadSprite('bluePlayerInBoard.png'),
        size: Vector2(30, 40),
        position: _getPositionInBoard(positionBluePLayer, 5),
      ),
    );
  }

  Vector2? _getPositionInBoard(double position, int espace) {
    Map<double, Vector2> positions = {};
    double houseEdge = boardEdge / 10;

    for (var i = 0; i < 10; i++) {
      if (i % 2 == 1) {
        for (double i = 1; i <= 10; i++) {
          positions[i] = Vector2(
              espace + (houseEdge * (i - 1)), boardSizeYEnd - houseEdge);
        }
        for (double i = 21; i <= 30; i++) {
          positions[i] = Vector2(
              espace + (houseEdge * (i - 21)), boardSizeYEnd - houseEdge * 3);
        }
        for (double i = 41; i <= 50; i++) {
          positions[i] = Vector2(
              espace + (houseEdge * (i - 41)), boardSizeYEnd - houseEdge * 5);
        }
        for (double i = 61; i <= 70; i++) {
          positions[i] = Vector2(
              espace + (houseEdge * (i - 61)), boardSizeYEnd - houseEdge * 7);
        }
        for (double i = 81; i <= 90; i++) {
          positions[i] = Vector2(
              espace + (houseEdge * (i - 81)), boardSizeYEnd - houseEdge * 9);
        }
      } else {
        for (double i = 11; i <= 20; i++) {
          positions[i] = Vector2(
              espace + ((boardEdge - houseEdge) - (houseEdge * (i - 11))),
              boardSizeYEnd - houseEdge * 2);
        }
        for (double i = 31; i <= 40; i++) {
          positions[i] = Vector2(
              espace + ((boardEdge - houseEdge) - (houseEdge * (i - 31))),
              boardSizeYEnd - houseEdge * 4);
        }
        for (double i = 51; i <= 60; i++) {
          positions[i] = Vector2(
              espace + ((boardEdge - houseEdge) - (houseEdge * (i - 51))),
              boardSizeYEnd - houseEdge * 6);
        }
        for (double i = 71; i <= 80; i++) {
          positions[i] = Vector2(
              espace + ((boardEdge - houseEdge) - (houseEdge * (i - 71))),
              boardSizeYEnd - houseEdge * 8);
        }
        for (double i = 91; i <= 100; i++) {
          positions[i] = Vector2(
              espace + ((boardEdge - houseEdge) - (houseEdge * (i - 91))),
              boardSizeYEnd - houseEdge * 10);
        }
      }
    }
    return positions[position];
  }

  Future<void> _jogar(int dice1, int dice2) async {
    final totalDice = dice1 + dice2;
    print(totalDice);
  }

  @override
  void update(double dt) {
    super.update(dt);
    positionBluePLayer += 1;
    sleep(Duration(milliseconds: 500));
    bluePlayerInBoard.position = _getPositionInBoard(positionBluePLayer, 5)!;
    positionRedPLayer += 1;
    sleep(Duration(milliseconds: 500));
    redPlayerInBoard.position = _getPositionInBoard(positionRedPLayer, 10)!;
    menssageOfRedPlayer.text =
        'Você está na casa: ${positionBluePLayer.toInt()}';
    menssageOfBluePlayer.text =
        'Você está na casa: ${positionBluePLayer.toInt()}';

    bluePlayerButton.update(dt);
    redPlayerButton.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownInfo event) {
    if (!dicesLauched) {
      if (turnOf == 'Blue') {
        bluePlayerButton.pressed =
            bluePlayerButton.area.contains(event.eventPosition.game.toOffset());
      } else {
        redPlayerButton.pressed =
            redPlayerButton.area.contains(event.eventPosition.game.toOffset());
      }
    }
  }
}

class Button {
  late SpriteComponent component;
  late Sprite spriteButton;
  late Sprite spriteButtonPressed;
  bool active = false;
  bool pressed = false;

  Button({
    required this.component,
    required this.spriteButton,
    required this.spriteButtonPressed,
  }) : super() {
    init();
  }

  @override
  void init() {
    component.sprite = spriteButton;
  }

  Vector2 get size => component.size;

  Vector2 get position => component.position;

  Rect get area => position & size;

  @override
  void update(double dt) {
    if (active) {
      if (pressed) {
        component.sprite = spriteButtonPressed;
      } else {
        component.sprite = spriteButton;
      }
    } else {
      component.sprite = spriteButtonPressed;
    }
  }
}
