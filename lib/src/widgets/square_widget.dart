import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/controllers/move_controller.dart';
import 'package:tictactoe/src/controllers/squares_controller.dart';

class SquareWidget extends ConsumerWidget {
  const SquareWidget(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSquare = ref.watch(historyController).last[id];
    return GestureDetector(
      onTap: currentSquare == null &&
              ref.read(historyController.notifier).checkWinner() == null
          ? () {
              ref.read(historyController.notifier).makeMove(id);
              ref.read(moveController.notifier).increment();
            }
          : null,
     
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
            child: Text(currentSquare ?? "",
                style: const TextStyle(fontSize: 50))),
      ),
    );
  }
}
