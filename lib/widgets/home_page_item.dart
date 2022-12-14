import 'package:first_app/model/password_item.dart';
import 'package:first_app/pages/detail_password_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final PasswordItem item;

  const ItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        color: Colors.white70,
        elevation: 8,
        child: new InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPasswordPage(item: item)),
            );
          },
          child: Column(
            children: [
              ListTile(
                title: Text(item.name),
                subtitle: Text(item.user),
              )
            ],
          ),
        ),
      ),
    );
  }
}
