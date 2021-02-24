import 'package:flutter/material.dart';

import 'game_board_view.dart';
import 'models/game_model.dart';

/// Game page widget.
///
/// Stateless. Provides scaffolding for the game board view widget.
class GamePage extends StatelessWidget {
  GameModel initialGameModel;

  GamePage({this.initialGameModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memory')),
      body: SafeArea(
        child: GameBoardView(initialGameModel: initialGameModel),
      ),
    );
  }
}
