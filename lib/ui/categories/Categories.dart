import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_learning_app/data/Categories.dart';
import 'package:food_learning_app/utils/categoriesData.dart';
import 'package:food_learning_app/widget/SearchCard.dart';
import 'package:http/http.dart' as http;

Map<String, String> get headers => {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "826155c0damshb4218ffbcf2554dp1a2017jsn8965ebf45cfb"
    };

Future<Categories> fetchCategories() async {
  final response = await http.get(
      Uri.parse("https://yummly2.p.rapidapi.com/categories/list"),
      headers: headers);
  final json = jsonDecode(response.body);
  return Categories.fromJson(json);
}

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late Future<Categories> categories;

  @override
  void initState() {
    categories = fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Popular Categories",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: FutureBuilder<Categories>(
          future: categories,
          builder: (context, snapshot) {
            print("Cats ${snapshot.data}");
            if (snapshot.hasData) {
              List<FoodCategory> browsCates = snapshot.data!.browseCats;
              List<FoodCategory> shoppingCates = snapshot.data!.shoppingCats;

              return ListView(children: <Widget>[
                SearchCard(),
                SizedBox(height: 20.0),
                buildCategoryTitle('Browse Category', context),
                SizedBox(height: 20.0),
                buildCategoryList(browsCates, context),
                SizedBox(height: 20.0),
                buildCategoryTitle('Shopping Category', context),
                SizedBox(height: 20.0),
                buildCategoryList(shoppingCates, context),
                SizedBox(height: 20.0),
                buildCategoryTitle('Cuisines', context),
                SizedBox(height: 20.0),
               
              ]);
            } else {
              return Text("Something went wrong ${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}

buildCategoryList(List<FoodCategory> categories, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 6,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          FoodCategory display = categories[index];
          return CategoryItem(display);
        }),
  );
}

class CategoryItem extends StatelessWidget {
  final FoodCategory display;

  CategoryItem(this.display);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            Image.network(
              display.display.categoryImage,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.7
                    ],
                    colors: [
                      Color.fromARGB(100, 0, 0, 0),
                      Color.fromARGB(100, 0, 0, 0),
                    ]),
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
                padding: const EdgeInsets.all(1),
                constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                child: Center(
                  child: Text(
                    display.display.displayName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildCategoryTitle(String title, BuildContext context) {
  return Text(
    "$title",
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
  );
}
