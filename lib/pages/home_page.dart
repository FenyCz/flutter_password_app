import 'package:first_app/db/password_db.dart';
import 'package:first_app/model/password_item.dart';
import 'package:first_app/pages/add_password_page.dart';
import 'package:first_app/provider/items_provider.dart';
import 'package:first_app/widgets/home_page_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: ItemListWidget(),
      // TODO prepared for db
      // child: FutureBuilder<List<PasswordItem>>(
      //   future: PasswordDatabase.instance.getItems(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<List<PasswordItem>> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: Text('Načítám...'));
      //     }
      //     return snapshot.data!.isEmpty
      //         ? Center(
      //             child: Text('Nejsou uložena žádná hesla.'),
      //           )
      //         : ListView(
      //             children: snapshot.data!.map((password) {
      //               return Center(
      //                 child: ListTile(title: Text(password.name)),
      //               );
      //             }).toList(),
      //           );
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewPassPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
