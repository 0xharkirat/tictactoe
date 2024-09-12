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
    return TextButton(
      
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(100, 100),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
      ),
      onPressed: currentSquare == null &&
              ref.read(historyController.notifier).checkWinner() == null
          ? () {
              ref.read(historyController.notifier).makeMove(id);
              ref.read(moveController.notifier).increment();
            }
          : null,
      child: Text(currentSquare ?? "",
          style: const TextStyle(fontSize: 50, color: Colors.black)),
    );
  }
}
