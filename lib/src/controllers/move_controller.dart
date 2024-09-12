import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoveController extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void makeMove(int id) {
    state = id;
  }

  void increment() {
    state++;
  }
}

final moveController = NotifierProvider<MoveController, int>(
  () => MoveController(),
);
