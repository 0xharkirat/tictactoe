import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/controllers/move_controller.dart';
import 'package:tictactoe/src/controllers/squares_controller.dart';

class HistoryListWidget extends ConsumerWidget {
  const HistoryListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.builder(
          itemCount: ref.watch(historyController).length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ListTile(
                  leading: Icon(
                    index == 0 ? Icons.play_arrow : Icons.history,
                  ),
                  onTap: () {
                    ref.read(historyController.notifier).goToStep(index);
                    ref.read(moveController.notifier).makeMove(index);
                  },
                  title: index == 0
                      ? const Text("Start New Game")
                      : Text("Go to Step $index"),
                  trailing: index == 0
                      ? null
                      : Icon(
                          index % 2 == 0 ? Icons.circle_outlined : Icons.close,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
