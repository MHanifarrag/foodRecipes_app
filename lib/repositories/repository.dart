import 'package:nutrition_app/repositories/meal_provider.dart';
import 'package:nutrition_app/repositories/state.dart';


class Repository {
  static final Repository _repository = Repository._private();
  Repository._private();
  factory Repository() => _repository;

  MealProvider _mealProvider = MealProvider();

  Future<State> mealData(query) => _mealProvider.getMealsByName(query);

}