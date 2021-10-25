import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_learning_app/data/Feed.dart';
import 'package:food_learning_app/widget/SearchCard.dart';

class FoodDetails extends StatelessWidget {
  FoodItem food;

  FoodDetails(this.food);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              food.name,
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                buildImageView(food, context),
                SizedBox(height: 10.0),
                Text(food.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 6.0),
                Text(food.description,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16)),
                SizedBox(height: 10.0),
                Text("Preparation Time: ${food.preparationTime}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10.0),
                Text("Number of Servings: ${food.numServing}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10.0),
                if (food.preparationSteps.isNotEmpty)
                  Text("Steps",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),

                SizedBox(height: 6.0),
                if (food.preparationSteps.isNotEmpty)
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: food.preparationSteps.length,
                      itemBuilder: (BuildContext context, int index) {
                        String step = food.preparationSteps[index];
                        return Padding(
                            padding: EdgeInsets.all(6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Step $index: ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700)),
                                Expanded(
                                  child: Text(step,
                                      style: TextStyle(color: Colors.black54)),
                                ),
                              ],
                            ));
                      })
              ],
            ),
          ),
        ));
  }

  buildImageView(FoodItem food, BuildContext context) {
    return Stack(
      children: [
        Image.network(food.image,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width),
        Positioned(
            top: 6.0,
            right: 6.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(
                      "${food.rating}",
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
