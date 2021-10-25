import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_learning_app/ui/detail/FoodDetail.dart';
import 'package:http/http.dart' as http;
import '../../widget/SearchCard.dart';
import '../../data/Feed.dart';
import '../../widget/SlideItem.dart';

Map<String, String> get headers => {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": ""
    };

Future<Feed> fetchFeed() async {
  final response = await http.get(
      Uri.parse("https://yummly2.p.rapidapi.com/feeds/list"),
      headers: headers);

  final responseJson = jsonDecode(response.body);
  print("print response ${responseJson}");
  return Feed.fromJson(responseJson);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  late Future<Feed> futureFeed;

  @override
  void initState() {
    super.initState();
    futureFeed = fetchFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchbar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: FutureBuilder<Feed>(
          future: futureFeed,
          builder: (context, snapshot) {
            print("feed ${snapshot.data}");
            if (snapshot.hasData) {
              List<FoodItem> feeds = snapshot.data!.feed;
              //  return Text("Something  ${snapshot.data}
              return ListView.builder(
                  itemCount: feeds.length,
                  itemBuilder: (BuildContext context, int index) {
                    FoodItem item = feeds[index];
                    return GestureDetector(
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FoodDetails(item)))
                            },
                        child: foodCard(item, context));
                  });
            } else {
              return Text("Something went wrong ${snapshot.error}");
            }
          },
        ),
      ),
    );
  }

  buildSearchbar(BuildContext context) {
    return PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(
            top: 60.0,
            left: 10.0,
            right: 10.0,
          ),
          child: SearchCard(),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 60.0));
  }

  foodCard(FoodItem item, BuildContext context) {
    return Container(
      child: SlideItem(
          img: item.display.image ?? "",
          title: item.display.displayName ?? "Yum",
          description: item.content.description?.text ?? "description"),
    );
  }
}
