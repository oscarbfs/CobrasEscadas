import 'package:cobras_e_escadas/cobras_escadas.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: SafeArea(
          child: GameWidget(
            game: CobrasEscadas(),
          ),
        ),
      ),
    ),
  );
}
