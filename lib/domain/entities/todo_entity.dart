
class TodoEntity {
  late String name;
  late DateTime finishTime;
  late bool isCompleted;
  int? id;

  TodoEntity({
    required this.name,
    required this.finishTime,
    this.isCompleted = false,
    this.id,
  });

  TodoEntity copyWith({
    int? id,
    String? name,
    DateTime? createTime,
    bool? isCompleted,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      finishTime: createTime ?? this.finishTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return '$id: $name $finishTime $isCompleted';
  }
}
