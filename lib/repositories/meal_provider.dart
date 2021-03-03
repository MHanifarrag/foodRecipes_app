import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nutrition_app/models/meals.dart';
import 'dart:convert';
import 'package:nutrition_app/repositories/state.dart';


class MealProvider {
  static final MealProvider _mealProvider = MealProvider._private();
  MealProvider._private();
  factory MealProvider() => _mealProvider;

  Client _client = Client();
  static const String _baseUrl = "https://www.themealdb.com";

  //Get list of meals based on the query
  Future<State> getMealsByName(String query) async {
    Response response;
    response = await _client
        .get("$_baseUrl/api/json/v1/1/search.php?s=$query");
    if (response.statusCode == 200)
      return State<MealsModel>.success(MealsModel.fromJson(json.decode(response.body)));
    else
      return State<String>.error(response.statusCode.toString());
  }


  //Get list of meal details based on meal id
  // ignore: missing_return
  Future<MealsModel> getMealDetails(String query) async {
      final mealsUrl ='$_baseUrl/api/json/v1/1/lookup.php?i=$query';
  final uri = mealsUrl;
  final response = await http.get(uri);
    if (response.statusCode == 200){
      return MealsModel.fromJson(json.decode(response.body));}
  }

  // ignore: missing_return
  Future<MealsModel> getRandomMealDetails() async {
    final mealsUrl ='$_baseUrl/api/json/v1/1/random.php';
    final uri = mealsUrl;
    final response = await http.get(uri);
    if (response.statusCode == 200){
      return MealsModel.fromJson(json.decode(response.body));}
  }

}