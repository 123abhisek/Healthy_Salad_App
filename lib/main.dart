
import 'package:flutter/material.dart';
import './FoodDesc.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Main Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  final String jsonData = '''
    {
      "salads": [
        {
          "name": "Greek Salad",
          "image": "assets/images/salad1.png",
          "category": "Mediterranean",
          "calories": 200,
          "ingredients": "3 large tomatoes, 1 cucumber, 1 red onion, 1 green bell pepper, 1/2 cup Kalamata olives, 1/2 cup feta cheese, 1/4 cup olive oil, 2 tablespoons red wine vinegar, 1 teaspoon dried oregano, Salt and pepper",
          "preparation": "Combine chopped tomatoes, sliced cucumber, thinly sliced red onion, and sliced green bell pepper. Add olives and feta cheese. Whisk together olive oil, vinegar, oregano, salt, and pepper. Pour over salad and toss."
        },
        {
          "name": "Caesar Salad",
          "image": "assets/images/salad2.png",
          "category": "Classic",
          "calories": 250,
          "ingredients": "1 head Romaine lettuce, 1/2 cup croutons, 1/4 cup Parmesan cheese, 1/4 cup Caesar dressing",
          "preparation": "Combine lettuce and croutons in a bowl. Add Parmesan cheese. Drizzle Caesar dressing and toss to coat."
        },
        {
          "name": "Caprese Salad",
          "image": "assets/images/salad3.png",
          "category": "Italian",
          "calories": 180,
          "ingredients": "4 large tomatoes, 1 cup fresh basil leaves, 1 ball fresh mozzarella cheese, 1/4 cup balsamic vinegar, 1/4 cup olive oil, Salt and pepper",
          "preparation": "Arrange tomato slices, basil leaves, and mozzarella on a platter. Drizzle with balsamic vinegar and olive oil. Sprinkle with salt and pepper."
        },
        {
          "name": "Quinoa Salad",
          "image": "assets/images/salad4.png",
          "category": "Healthy",
          "calories": 220,
          "ingredients": "1 cup quinoa, 1 red bell pepper, 1 cucumber, 1 cup cherry tomatoes, 1/4 cup red onion, 1/4 cup feta cheese, 2 tablespoons olive oil, 1 tablespoon lemon juice, Salt and pepper",
          "preparation": "Cook quinoa and let it cool. Combine quinoa, diced bell pepper, cucumber, cherry tomatoes, and red onion. Add feta cheese. Whisk together olive oil, lemon juice, salt, and pepper. Pour over salad and toss."
        },
        {
          "name": "Strawberry Salad",
          "image": "assets/images/salad3.png",
          "category": "Fruit",
          "calories": 150,
          "ingredients": "4 cups fresh spinach, 1 cup strawberries, 1/4 cup sliced almonds, 1/4 cup goat cheese, 2 tablespoons balsamic vinegar, 1 tablespoon honey, 1/4 cup olive oil, Salt and pepper",
          "preparation": "Combine spinach and sliced strawberries. Add almonds and goat cheese. Whisk together balsamic vinegar, honey, olive oil, salt, and pepper. Pour over salad and toss."
        }
      ]
    }
  ''';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = json.decode(jsonData);
    List<dynamic> salads = data['salads'];

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        leading: IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.menu,
            size: 40,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.search,
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              // Heading
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                padding: EdgeInsets.zero,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Healthy Salads",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Healthy and nutritious food recipes",
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
              // Rounded Card
              SizedBox(
                height: 80.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    RoundedCard(
                      text: 'Lunch',
                      icon: Icons.lunch_dining,
                    ),
                    RoundedCard(
                      text: 'Fruit',
                      icon: Icons.event_seat,
                    ),
                    RoundedCard(
                      text: 'Meat',
                      icon: Icons.no_meals,
                    ),
                    RoundedCard(
                      text: 'Spices',
                      icon: Icons.set_meal_outlined,
                    ),
                  ],
                ),
              ),
              // Round card
              Container(
                height: 310,
                margin: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: salads.map((salad) {
                    return RoundCard(
                      image: AssetImage(salad['image']),
                      title: salad['name'],
                      category: salad['category'],
                      kcal: "${salad['calories']} Kcal",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodDesc(
                                title: salad['name'],
                                description: salad['category'],
                                ingredients: salad['ingredients'],
                                recipe: salad['preparation'],
                                imagePath: salad['image'],
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              // Popular Card Heading
              Container(
                margin: EdgeInsets.only(top: 0, left: 20, right: 20), // Remove top margin
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "recipes",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
              // Popular Card
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  children: salads.map((salad) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: PopularRoundCard(
                        image: AssetImage(salad['image']),
                        title: salad['name'],
                        category: salad['category'],
                        kcal: "${salad['calories']} Kcal",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDesc(
                                  title: salad['name'],
                                  description: salad['category'],
                                  ingredients: salad['ingredients'],
                                  recipe: salad['preparation'],
                                  imagePath: salad['image'],
                                )),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class PopularRoundCard extends StatefulWidget {
  final ImageProvider image;
  final String title;
  final String category;
  final String kcal;
  final Function() onTap;
  const PopularRoundCard({
    Key? key,
    required this.image,
    required this.title,
    required this.category,
    required this.kcal,
    required this.onTap,
  }) : super(key: key);

  @override
  _PopularRoundCardState createState() => _PopularRoundCardState();
}

class _PopularRoundCardState extends State<PopularRoundCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 360,
        margin: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -30.0,
                child: Image(
                  image: widget.image,
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.category,
                      style: TextStyle(fontSize: 16 , color: Colors.black45,),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.kcal,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorited =
                                !isFavorited; // Toggle the favorite state
                              });
                            },
                            icon: Icon(
                              isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 30,
                              color: isFavorited ? Colors.red : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundCard extends StatefulWidget {
  final AssetImage image;
  final String title;
  final String category;
  final String kcal;
  final VoidCallback onTap;

  const RoundCard({
    Key? key,
    required this.image,
    required this.title,
    required this.category,
    required this.kcal,
    required this.onTap,
  }) : super(key: key);

  @override
  _RoundCardState createState() => _RoundCardState();
}

class _RoundCardState extends State<RoundCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 230,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150), // Adjust height to fit the positioned image
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  widget.category,
                  style: TextStyle(fontSize: 16, color: Colors.black45,),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.kcal,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorited = !isFavorited; // Toggle the favorite state
                        });
                      },
                      icon: Icon(
                        isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 30,
                        color: isFavorited ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: -60,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const RoundedCard({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







