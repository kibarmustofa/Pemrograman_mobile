import 'package:master_plan/model/task.dart';

class Plan {
  final String name;
  final List<Task> task;

  const Plan({this.name = '', this.task = const []});
}
