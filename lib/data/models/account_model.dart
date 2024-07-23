class Account {
  final String id;
  final String table;

  Account({required this.id, required this.table});

  // Convert a Account into a Map. The keys must correspond to the names of the attributes.
  Map<String, dynamic> toJson() => {
        'id': id,
        'table': table,
      };

  // Convert a Map into a Account
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      table: json['table'],
    );
  }
}