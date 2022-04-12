import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  int? _index;
  int get index => _index!;

  void getIndex(context) {
    _index = context;
    notifyListeners();
  }
}
