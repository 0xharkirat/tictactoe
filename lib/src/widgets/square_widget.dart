import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tictactoe/src/controllers/move_controller.dart';
import 'package:tictactoe/src/controllers/squares_controller.dart';

class SquareWidget extends ConsumerWidget {
  const SquareWidget(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSquare = ref.watch(historyController).last[id];
    return ShadButton(
      cursor: SystemMouseCursors.click,
      padding: EdgeInsets.zero,
      enabled: currentSquare == null &&
          ref.read(historyController.notifier).checkWinner() == null,
      backgroundColor: ShadTheme.of(context).colorScheme.background,
      width: 100,
      height: 100,
      hoverBackgroundColor: ShadTheme.of(context).colorScheme.primaryForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: BorderRadius.circular(0),
          color: Colors.white,
          width: 1,
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
          style: TextStyle(
            fontSize: 50,
            color: ShadTheme.of(context).colorScheme.foreground,
          )),
    );
  }
}
