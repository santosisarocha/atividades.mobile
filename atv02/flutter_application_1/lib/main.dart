import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FoodItem {
  final String name;
  final double price;

  FoodItem({required this.name, required this.price});
}

class MyApp extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(name: 'Pizza', price: 10.0),
    FoodItem(name: 'Hamburguer', price: 8.0),
    FoodItem(name: 'Salad', price: 5.0),
    FoodItem(name: 'Pasta', price: 12.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food List'),
        ),
        body: FoodList(foodItems: foodItems),
      ),
    );
  }
}

class FoodList extends StatefulWidget {
  final List<FoodItem> foodItems;

  FoodList({required this.foodItems});

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.foodItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.foodItems[index].name),
                subtitle: Text('\$${widget.foodItems[index].price.toStringAsFixed(2)}'),
                onTap: () {
                  setState(() {
                    total += widget.foodItems[index].price;
                  });
                },
              );
            },
          ),
        ),
        Text(
          'Total: \$${total.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
