import 'package:flutter/material.dart';

import 'game_board_view.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memory')),
      body: SafeArea(
        child: GameBoardView(),
      ),
    );
  }
}