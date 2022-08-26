import 'package:first_app/model/password_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPasswordPage extends StatefulWidget {
  DetailPasswordPage({super.key, required this.item});

  final PasswordItem item;

  @override
  State<DetailPasswordPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPasswordPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.item.name}'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                readOnly: true,
                controller: TextEditingController()
                  ..text = '${widget.item.name}',
                decoration: InputDecoration(
                  labelText: 'Název',
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController()
                  ..text = '${widget.item.user}',
                decoration: InputDecoration(
                  labelText: 'Uživatel',
                ),
              ),
              TextField(
                obscureText: _isObscure,
                readOnly: true,
                controller: TextEditingController()
                  ..text = '${widget.item.pwd}',
                decoration: InputDecoration(
                  labelText: 'Heslo',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
