// This file contains the Habit class, which is used to create habit objects
class Habit {
  // make it so that whenever a new habit object is created, the created date is saved
  int habitID;
  String name;
  String description;
  bool isCompletedToday = false;
  final List<DateTime> completedDates = [];
  final DateTime createdTime = DateTime.now();

  Habit({
    required this.habitID,
    required this.name,
    required this.description,
  });

  // make it so that the habit object can be converted to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'createdTime': createdTime,
    };
  }

  // rename a habit object
  void rename(String newName) {
    name = newName;
  }

  // edit the description of a habit object
  void editDescription(String newDescription) {
    description = newDescription;
  }

  // function to add today's date to the completedDates list
  void markCompleted() {
    if (isCompletedToday) {
      completedDates.removeLast();
      isCompletedToday = false;
    } else {
      completedDates.add(DateTime.now());
      isCompletedToday = true;
    }
  }
}
