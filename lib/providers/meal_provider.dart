import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:projects_2/data/fake.dart";

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
