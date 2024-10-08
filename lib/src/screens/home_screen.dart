import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
        backgroundColor: ShadTheme.of(context).colorScheme.primaryForeground,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new, color: Colors.white),
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
          bool isWideScreen = constraints.maxWidth > 600;

          return SingleChildScrollView(
            // Make the entire page scrollable
            child: Center(
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoardWidget(),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: constraints.maxWidth < 650 ? 250 : 300,
                          child: const HistoryListWidget(),
                        ),
                      ],
                    )
                  else
                    const Column(
                      children: [
                        BoardWidget(),
                        SizedBox(height: 20),
                        HistoryListWidget(),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
