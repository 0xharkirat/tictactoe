import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryController extends Notifier<List<List<String?>>> {
  @override
  List<List<String?>> build() {
    return [List.filled(9, null)];
  }

  void makeMove(int id) {
    final currentHistory = state.last;
    final newHistory = List<String?>.from(currentHistory);
    newHistory[id] = state.length % 2 == 0 ? "O" : "X";
    state = [...state, newHistory];
  }

  static final winningCombination = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  String? checkWinner() {
    final history = state;
    for (final combination in winningCombination) {
      final square1 = history.last[combination[0]];
      final square2 = history.last[combination[1]];
      final square3 = history.last[combination[2]];
      if (square1 != null &&
          square1 == square2 &&
          square2 == square3 &&
          square3 == square1) {
        return square1;
      }
    }
    return null;
  }

  void goToStep(int step) {
    state = state.sublist(0, step + 1);
  }
}

final historyController =
    NotifierProvider<HistoryController, List<List<String?>>>(
  () => HistoryController(),
);
