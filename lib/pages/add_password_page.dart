import 'package:first_app/db/password_db.dart';
import 'package:first_app/model/password_item.dart';
import 'package:flutter/material.dart';

class NewPassPage extends StatelessWidget {
  const NewPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Password'),
      ),
      body: const AddForm(),
    );
  }
}

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddFormState();
  }
}

class AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String itemName = "";
  String itemUser = "";
  String itemPwd = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                itemName = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Zadejte název';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Název (URL nebo název služby)'),
            ),
            TextFormField(
              onChanged: (value) {
                itemUser = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Zadejte uživatelské jméno';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Uživatelské jméno'),
            ),
            TextFormField(
              onChanged: (value) {
                itemPwd = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Zadejte heslo';
                }
                return null;
              },
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Heslo'),
            ),
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: ElevatedButton(
                onPressed: () async {
                  // if all input text is set
                  if (_formKey.currentState!.validate()) {
                    // add item into db
                    await PasswordDatabase.instance.add(PasswordItem(
                        name: itemName, user: itemUser, pwd: itemPwd));
                    // get to main page
                    Navigator.pop(context);
                  }
                },
                child: const Text('Uložit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
