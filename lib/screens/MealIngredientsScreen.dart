import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/models/meals.dart';
import 'package:nutrition_app/repositories/meal_provider.dart';

class MealIngredientsScreen extends StatelessWidget {
  String replaceWhitespacesUsingRegex(String s, String replace) {
    if (s == null) {
      return null;
    }
    // This pattern means "at least one space, or more"
    // \\s : space
    // +   : one or more
    final pattern = RegExp('\\s+');
    return s.replaceAll(pattern, replace);
  }

  @override
  Widget build(BuildContext context) {
    final String meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        color: Color(0XffFDD835),
        child: FutureBuilder<MealsModel>(
          future: MealProvider().getMealDetails(meal),
          builder: (BuildContext context, AsyncSnapshot<MealsModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data.meals[index].strMealThumb),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey.withOpacity(0.3),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(snapshot
                                          .data.meals[index].strMealThumb),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.meals[index].strMeal,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 15.0,
                                            color: Colors.black,
                                            offset: Offset(5.0, 5.0),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: <Widget>[
// ingredient 1
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient1, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure1,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 2
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient2, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure2,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 3
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient3, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure3,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 4
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient4, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient4,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure4,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 5
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient5, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient5,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure5,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 6
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient6, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient6,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure6,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 7
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient7, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient7,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure7,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 8
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient8, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient8,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure8,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 9
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient9, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strIngredient9,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure9,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

// ingredient 10
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        "https://www.themealdb.com/images/ingredients/${replaceWhitespacesUsingRegex(snapshot.data.meals[index].strIngredient10, '%20')}.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot.data.meals[index]
                                              .strIngredient10,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Text(
                                          snapshot
                                              .data.meals[index].strMeasure10,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 20),
                            child: Text(
                              "Instructions",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),

                        Card(
                          margin: const EdgeInsets.only(
                              right: 20, left: 20, top: 10, bottom: 20),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              snapshot.data.meals[index].strInstructions,
                              style: TextStyle(fontSize: 14.0, height: 2),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
