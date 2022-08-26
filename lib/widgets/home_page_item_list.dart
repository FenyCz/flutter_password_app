import 'package:first_app/model/password_item.dart';
import 'package:first_app/provider/items_provider.dart';
import 'package:first_app/widgets/home_page_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ItemListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsProvider>(context);
    final items = provider.items;

    return ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];

          return ItemWidget(item: item);
        },
        itemCount: items.length);

    // return Center(
    //   child: Text(
    //     'Žádná hesla.',
    //   ),
    // );
    // : ListView.separated(
    //     physics: BouncingScrollPhysics(),
    //     padding: EdgeInsets.all(16),
    //     separatorBuilder: (context, index) => Container(height: 8),
    //     itemCount: todos.length,
    //     itemBuilder: (context, index) {
    //       final todo = todos[index];
    //
    //       return TodoWidget(todo: todo);
    //     },
    //  );
  }
}
