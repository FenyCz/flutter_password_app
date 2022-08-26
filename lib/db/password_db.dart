import 'dart:async';
import 'dart:io';
import 'package:first_app/model/password_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PasswordDatabase {
  PasswordDatabase._privateConstructor();
  static final PasswordDatabase instance =
      PasswordDatabase._privateConstructor();

  static Database? _database;
  // use existing db or make instance
  Future<Database> get database async => _database ??= await _initDatabase();

  // db init
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'passwords.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

// create table in db
  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE passwords(id INTEGER PRIMARY KEY, name STRING, user STRING, pwd STRING)',
    );
  }

  Future<List<PasswordItem>> getItems() async {
    Database db = await instance.database;
    var pwds = await db.query('passwords', orderBy: 'name');

    return pwds.isNotEmpty
        ? pwds.map((c) => PasswordItem.fromMap(c)).toList()
        : [];
  }

  Future<int> add(PasswordItem item) async {
    Database db = await instance.database;
    return await db.insert('passwords', item.toMap());
  }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'password_db.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE passwords(id INTEGER PRIMARY KEY, name STRING, user STRING, pwd STRING)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );
//
//   // Define a function that inserts dogs into the database
//   Future<void> insert(PasswordItem pwditem) async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Insert the Dog into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same dog is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'passwords',
//       pwditem.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   // A method that retrieves all the dogs from the dogs table.
//   Future<List<PasswordItem>> getFromDb() async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Query the table for all The Dogs.
//     final List<Map<String, dynamic>> maps = await db.query('passwords');
//
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(maps.length, (i) {
//       return PasswordItem(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         user: maps[i]['age'],
//         pwd: maps[i]['pwd'],
//       );
//     });
//   }
//
//   Future<void> delete(int id) async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Remove the Dog from the database.
//     await db.delete(
//       'dogs',
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
//
//   // Create a Dog and add it to the dogs table
//   var firs = const PasswordItem(
//     id: 0,
//     name: 'GitHub',
//     user: 'Ferenc',
//     pwd: '35',
//   );
//
//   await insert(firs);
//
//   // Now, use the method above to retrieve all the dogs.
//   print(await getFromDb()); // Prints a list that include Fido.
//
//   // Delete Fido from the database.
//   await delete(firs.id);
//
//   // Print the list of dogs (empty).
//   print(await getFromDb());
// }
//
// class Dog {
//   final int id;
//   final String name;
//   final int age;
//
//   const Dog({
//     required this.id,
//     required this.name,
//     required this.age,
//   });
//
//   // Convert a Dog into a Map. The keys must correspond to the names of the
//   // columns in the database.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//   }
//
//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'Dog{id: $id, name: $name, age: $age}';
//   }
}
