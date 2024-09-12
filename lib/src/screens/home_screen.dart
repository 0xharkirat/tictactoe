import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/controllers/move_controller.dart';
import 'package:tictactoe/src/controllers/squares_controller.dart';
import 'package:tictactoe/src/widgets/board_widget.dart';
import 'package:tictactoe/src/widgets/history_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final winner =
                  ref.watch(historyController.notifier).checkWinner();
              final currentPlayer =
                  ref.watch(moveController) % 2 == 0 ? "X" : "O";
              if (winner != null) {
                return Text(
                  "Winner: $winner",
                  style: const TextStyle(fontSize: 50),
                );
              }
              return Text(
                "Next player: $currentPlayer",
                style: const TextStyle(fontSize: 50),
              );
            }),
            const BoardWidget(),
            const SizedBox(height: 20),
            const HistoryListWidget(),
          ],
        ),
      ),
    );
  }
}
