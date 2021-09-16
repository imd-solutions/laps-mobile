import 'package:flutter/material.dart';
import './../../../enum/enum.dart';

class BaseModel extends ChangeNotifier {
  ViewStateType _state = ViewStateType.Idle;
  int? _currentPage;

  ViewStateType get state => _state;
  int? get currentPage => _currentPage;

  void setState(ViewStateType viewState) {
    _state = viewState;
    notifyListeners();
  }
  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}