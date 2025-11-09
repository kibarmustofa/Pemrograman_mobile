import 'package:master_plan/model/task.dart';

class Plan {
  final String name;
  final List<Task> task;

  const Plan({this.name = 'New Plan', this.task = const []});

   int get completedCount => task.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${task.length} task';
}
