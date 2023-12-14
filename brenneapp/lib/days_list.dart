class DaysList {
  // other members

  static void processLists(List<List<String>> allDaysLists) {
    // Process the lists as needed
    // For example, concatenate them into a single list
    List<String> flattenedDaysList =
        allDaysLists.expand((days) => days).toList();

    // Perform any other operations with the flattened list
    print("Flattened Days List: $flattenedDaysList");
  }
}
