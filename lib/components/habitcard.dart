// create a card widget in cupertino style for habit datatype

import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/datatype/habit.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({Key? key, required this.habit}) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  habit.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                habit.isCompletedToday
                    ? const SizedBox()
                    : Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Completed ${habit.completedDates.length} times',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
            const Spacer(),
            CupertinoButton(
              color: const Color.fromARGB(255, 251, 244, 255),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              borderRadius: BorderRadius.circular(40),
              onPressed: () {
                habit.markCompleted();
              },
              child: Icon(CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.black.withAlpha(200)),
            ),
          ],
        ));
  }
}
