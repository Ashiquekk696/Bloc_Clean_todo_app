// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String time;
   @HiveField(3)
  final String status;

  TaskModel({required this.name, required this.description, required this.time,this.status = "todo"});

  TaskModel copyWith({
    String? name,
    String? description,
    String? time,
    TaskStatus? status,
  }) {
    return TaskModel(
      name: name ?? this.name,
      description: description ?? this.description,
      time: time ?? this.time,
      status: status?.name ?? this.status,
    );
  }
}

enum TaskStatus {inProgress,done,todo}