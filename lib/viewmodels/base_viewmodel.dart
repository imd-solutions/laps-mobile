import 'package:flutter/material.dart';
import './../enum/enum.dart';

class BaseViewModel extends ChangeNotifier {
  ViewStateType _state = ViewStateType.Idle;
  late int _currentPage;

  ViewStateType get state => _state;
  int get currentPage => _currentPage;

  void setState(ViewStateType viewState) {
    _state = viewState;
    notifyListeners();
  }
  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}