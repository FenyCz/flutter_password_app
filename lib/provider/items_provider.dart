import 'package:first_app/model/password_item.dart';
import 'package:flutter/material.dart';

class ItemsProvider extends ChangeNotifier {
  List<PasswordItem> _passwordItems = [];

  List<PasswordItem> get items => _passwordItems.toList();

  void addItem(PasswordItem item) {
    _passwordItems.add(item);

    notifyListeners();
  }
}
