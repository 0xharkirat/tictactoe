import 'package:flutter/material.dart';
import 'package:tictactoe/src/widgets/square_widget.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            SquareWidget(0),
            SquareWidget(1),
            SquareWidget(2),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SquareWidget(3),
            SquareWidget(4),
            SquareWidget(5),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SquareWidget(6),
            SquareWidget(7),
            SquareWidget(8),
          ],
        ),
      ],
    );
  }
}
