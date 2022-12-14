import 'package:first_app/db/password_db.dart';
import 'package:first_app/model/password_item.dart';
import 'package:first_app/pages/add_password_page.dart';
import 'package:first_app/widgets/home_page_item.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<PasswordItem>>(
        future: PasswordDatabase.instance.getItems(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PasswordItem>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Načítám...'));
          }
          return snapshot.data!.isEmpty
              ? Center(
                  child: Text('Nejsou uložena žádná hesla.'),
                )
              : ListView(
                  children: snapshot.data!.map((password) {
                    return ItemWidget(
                      item: PasswordItem(
                        id: password.id,
                        name: password.name,
                        user: password.user,
                        pwd: password.pwd,
                      ),
                    );
                  }).toList(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // push to new page and afterwards setState to refresh the home page
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewPassPage()),
          ).then((_) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
