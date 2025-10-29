import 'package:flutter/material.dart';
import '../model/data_layers.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // saat scroll, hapus focus dari semua TextField sehingga keyboard turun (berguna di iOS)
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
    return Scaffold(
      // ganti 'Namaku' -> saya pakai 'Kibar' sesuai konteks
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        title: const Text('Master Plan Kibar',
          style: TextStyle(
            color: Colors.white,        // font jadi putih
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
      ),
      
      body: Container(
        color: Colors.purple.shade50, // ubah warna latar belakang di sini
        child: _buildList(),
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            task: List<Task>.from(plan.task)
              ..add(const Task()),
          );
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.task.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.task[index], index),
    );
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                task: List<Task>.from(plan.task)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              task: List<Task>.from(plan.task)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
}
