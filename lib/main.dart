import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/actionbutton.dart';
import 'package:habit_tracker/datatype/habit.dart';
import 'package:habit_tracker/components/habitcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: MyHomePage(
        title: 'Habit Tracker',
        habits: [
          Habit(
            habitID: 1,
            name: 'Exercise',
            description: 'Do 30 minutes of exercise',
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.habits});

  final String title;
  final List<Habit> habits;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addNewHabit() {
    // create a new habit object
    final newHabit = Habit(
      habitID: 2,
      name: 'Diet',
      description: 'Eat less pig.',
    );
    // add the new habit object to the list of habits
    setState(() {
      widget.habits.add(newHabit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title),
            const SizedBox(width: 10),
            ActionButton(
              onPressed: addNewHabit,
              icon: CupertinoIcons.add,
            ),
          ],
        ),
      ),
      child: Center(
          child: ListView.builder(
              itemCount: widget.habits.length,
              itemBuilder: (context, index) {
                return HabitCard(habit: widget.habits[index]);
              })),
      // add a bottom bar button to add a new habit
    );
  }
}
