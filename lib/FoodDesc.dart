
import 'package:flutter/material.dart';

class FoodDesc extends StatefulWidget {
  final String title;
  final String description;
  final String ingredients;
  final String recipe;
  final String imagePath;

  FoodDesc({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.recipe,
    required this.imagePath, // Initialize the imagePath
  });

  @override
  _FoodDescState createState() => _FoodDescState();
}

class _FoodDescState extends State<FoodDesc> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited; // Toggle the favorite state
              });
            },
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border_outlined,
              size: 40,
              color: isFavorited ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title and Description
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Nutrition Cards
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nutritions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 8),
                        NutritionCard(
                          text: 'Calories',
                          value: '370',
                        ),
                        SizedBox(height: 12),
                        NutritionCard(
                          text: 'Carbo',
                          value: '35',
                        ),
                        SizedBox(height: 12),
                        NutritionCard(
                          text: 'Protein',
                          value: '6.8',
                        ),
                      ],
                    ),
                  ),

                  // Ingredients
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredients",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 15),
                        // Split ingredients by line break
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.ingredients.split('\n').map((ingredient) {
                            return Text(
                              ingredient.trim(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  // Recipe Preparation
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recipe Preparation",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.recipe,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned widget for image overlay
          Positioned(
            top: 10,
            right: -90,
            child: Image.asset(
              widget.imagePath,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned widget for floating action
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingNutritionCard(
              icon: Icons.play_arrow,
              text: 'Watch Video',
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionCard extends StatelessWidget {
  final String text;
  final String value;

  NutritionCard({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      padding: EdgeInsets.all(16),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -25,
            left: -60,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lime,
              ),
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30), // Adjust this value to overlay correctly
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingNutritionCard extends StatelessWidget {
  final IconData icon;
  final String text;

  FloatingNutritionCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -22,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lime,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30), // Adjust this value to overlay correctly
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
