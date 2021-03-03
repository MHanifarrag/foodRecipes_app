import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/blocs/home_screen_bloc.dart';
import 'package:nutrition_app/models/meals.dart';
import 'package:nutrition_app/repositories/meal_provider.dart';
import 'package:nutrition_app/screens/MealIngredientsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    MealProvider _mealProvider = MealProvider();

    return Scaffold(
      backgroundColor: Color(0XffFDD835),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                "What Do You Want \nTo Cook ?",
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29.5),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search recipes",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search)),
                onChanged: (value) {
                  bloc.changeQuery(value);
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: StreamBuilder(
                  stream: bloc.mealsList,
                  builder: (context, AsyncSnapshot<MealsModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20, bottom: 5.0),
                              child: Text(
                                "Search Results",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              child: ListView.builder(
                                  itemCount: snapshot.data.meals.length,
                                  itemBuilder: (context, index) {
                                    return mealItem(
                                        snapshot.data.meals[index], context);
                                  }),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return FutureBuilder<MealsModel>(
                        future: _mealProvider.getRandomMealDetails(),
                        // async work
                        builder: (BuildContext context,
                            AsyncSnapshot<MealsModel> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20, top: 20),
                                    child: Text(
                                      "Random Meal",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 200.0,
                                    child: ListView.builder(
                                        itemCount: snapshot.data.meals.length,
                                        itemBuilder: (context, index) {
                                          return mealItem(
                                              snapshot.data.meals[index],
                                              context);
                                        }),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget mealItem(Meals meals, BuildContext context) {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 10.0,
    margin: EdgeInsets.only(bottom: 20, right: 16.0, left: 16.0),
    child: InkWell(
      splashColor: Color(0XffFD7435),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealIngredientsScreen(),
            settings: RouteSettings(
              arguments: meals.idMeal,
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(meals.strMealThumb),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(child: Text(meals.strMeal)),
          ),
        ],
      ),
    ),
  );
}
