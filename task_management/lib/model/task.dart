class Task {
  final String? id;
  late final String? title;
  late final String? description;

  Task({this.id, this.title, this.description});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
