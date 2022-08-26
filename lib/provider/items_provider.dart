import 'package:first_app/model/password_item.dart';
import 'package:flutter/material.dart';

class ItemsProvider extends ChangeNotifier {
  List<PasswordItem> _passwordItems = [
    PasswordItem(
        id: '6c84fb90-12c4-11e1-840d-7b25c5ee775a',
        name: 'Github',
        pwd: '1234',
        user: 'moravian12'),
    PasswordItem(
        id: '6c84fb90-12c4-11e1-840d-7b25c5ee775a',
        name: 'Seznam.cz',
        pwd: 'as56d8',
        user: 'marek'),
  ];

  List<PasswordItem> get items => _passwordItems.toList();

  void addItem(PasswordItem item) {
    _passwordItems.add(item);

    notifyListeners();
  }
}
