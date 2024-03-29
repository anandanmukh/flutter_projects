import 'package:chess_game/components/square.dart';
import 'package:flutter/material.dart';

import 'components/piece.dart';
import 'helper/helper_methods.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // create a piece
  ChessPiece myPawn = ChessPiece(
    type: ChessPieceType.pawn,
    isWhite: true,
    imagePath: '..lib/images/pawn.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 8 * 8,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          return Square(
            isWhite: isWhite(index),
            piece: myPawn,
          );
        },
      ),
    );
  }
}
