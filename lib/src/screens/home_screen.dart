import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/controllers/move_controller.dart';
import 'package:tictactoe/src/controllers/squares_controller.dart';
import 'package:tictactoe/src/widgets/board_widget.dart';
import 'package:tictactoe/src/widgets/history_list_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe w Flutter & Riverpod'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            tooltip: "Go to Harkirat's Github",
            onPressed: () {
              const url = "https://github.com/0xharkirat";
              launchUrl(Uri.parse(url));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is larger than a specific breakpoint, e.g., 600
          bool isWideScreen = constraints.maxWidth > 600;

          return Center(
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
                const SizedBox(height: 20),
                // Use Row for wide screens, Column for narrow screens
                if (isWideScreen)
                  const Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoardWidget(),
                        SizedBox(width: 20),
                        SizedBox(
                          width: 300,
                          child: HistoryListWidget(),
                        ),
                      ],
                    ),
                  )
                else
                  const Expanded(
                    child: Column(
                      children: [
                        BoardWidget(),
                        SizedBox(height: 20),
                        Expanded(child: HistoryListWidget()),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
