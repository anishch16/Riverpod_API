import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountDemo extends StateNotifier<int> {
  CountDemo() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
