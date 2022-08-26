class PasswordItem {
  final String id;
  final String name;
  final String user;
  final String pwd;

  const PasswordItem(
      {required this.id,
      required this.name,
      required this.user,
      required this.pwd});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user': user,
      'pwd': pwd,
    };
  }

  factory PasswordItem.fromMap(Map<String, dynamic> json) => new PasswordItem(
      id: json['id'], name: json['name'], user: json['user'], pwd: json['pwd']);

  // @override
  // String toString() {
  //   return 'PasswordItem{id: $id, name: $name, user: $user, pwd: $pwd}';
  // }
}
