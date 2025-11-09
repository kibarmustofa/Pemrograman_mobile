import 'package:flutter/material.dart';
import '../model/data_layers.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          plan.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple.shade50,
        child: ValueListenableBuilder<List<Plan>>(
          valueListenable: plansNotifier,
          builder: (context, plans, child) {
            Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
            return Column(
              children: [
                Expanded(child: _buildList(currentPlan)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      currentPlan.completenessMessage,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

        // ambil list task lama dan tambahkan task baru
        List<Task> updated = List<Task>.from(currentPlan.task)..add(const Task());

        // perbarui daftar plan dengan plan baru
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            task: updated,
          );

        // perbarui state lokal
        setState(() {
          widget.plan.task
            ..clear()
            ..addAll(updated);
        });
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior:
          Theme.of(context).platform == TargetPlatform.iOS
              ? ScrollViewKeyboardDismissBehavior.onDrag
              : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.task.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.task[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              task: List<Task>.from(currentPlan.task)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );

          setState(() {
            widget.plan.task[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        ),
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              task: List<Task>.from(currentPlan.task)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );

          setState(() {
            widget.plan.task[index] = Task(
              description: text,
              complete: task.complete,
            );
          });
        },
      ),
    );
  }
}